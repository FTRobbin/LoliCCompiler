package gen.spim;

import gen.spim.spimcfg.Block;
import gen.spim.spimcfg.Graph;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/27.
 */
public class SPIMControlFlow {

    public static boolean isJump(SPIMInst inst) {
        return inst.op != null &&
                (inst.op.equals(SPIMOp.b) ||
                        inst.op.equals(SPIMOp.beq) ||
                        inst.op.equals(SPIMOp.bne) ||
                        inst.op.equals(SPIMOp.bge) ||
                        inst.op.equals(SPIMOp.bgt) ||
                        inst.op.equals(SPIMOp.ble) ||
                        inst.op.equals(SPIMOp.blt) ||
                        inst.op.equals(SPIMOp.jr) ||
                        inst.op.equals(SPIMOp.j));
    }

    public static void markLeader(SPIMCode code) {
        boolean lastJump = true, lastLabel = false;
        for (SPIMInst inst : code.text) {
            if ((inst.label != null && !lastLabel) || lastJump) {
                inst.isLeader = true;
            }
            lastJump = isJump(inst);
            lastLabel = inst.label != null;
        }
    }

    public static void cutFuncBlocks(SPIMCode code) {
        Graph g = null;
        Block cur = null, entry = null;
        code.graphs = new LinkedList<>();
        for (SPIMInst inst : code.text) {
            if (inst.label != null && (inst.label.label.equals("main") || inst.label.label.charAt(1) == '_')) {
                if (cur != null) {
                    Block exit = new Block();
                    if (!cur.equals(entry)) {
                        cur.addEdge(exit);
                    }
                    for (Block b : g.blocks) {
                        if (b.insts.size() > 0) {
                            SPIMInst last = b.insts.get(b.size() - 1);
                            if (last.label == null && last.op.equals(SPIMOp.jr) && last.val0.equals(SPIMRegID.$ra)) {
                                b.addEdge(exit);
                            }
                        }
                    }
                }
                g = new Graph();
                entry = new Block();
                g.addBlock(entry);
                cur = entry;
                code.graphs.add(g);
            }
            if (inst.isLeader) {
                Block old = cur;
                cur = new Block();
                if (old.equals(entry) || !isJump(old.insts.get(old.insts.size() - 1))) {
                    old.addEdge(cur);
                }
                g.addBlock(cur);
            }
            cur.addInst(inst);
        }
    }

    public static void addEdges(SPIMCode code) {
        for (Graph g : code.graphs) {
            for (Block b : g.blocks) {
                for (SPIMInst inst : b.insts) {
                    if (isJump(inst)) {
                        SPIMLabel target = null;
                        if (inst.op.use == 1) {
                            if (inst.val0 instanceof SPIMAddress) {
                                target = ((SPIMAddress) inst.val0).label;
                            }
                        } else if (inst.op.use == 2) {
                            if (inst.val1 instanceof SPIMAddress) {
                                target = ((SPIMAddress) inst.val1).label;
                            }
                        } else if (inst.op.use == 3) {
                            if (inst.val2 instanceof SPIMAddress) {
                                target = ((SPIMAddress) inst.val2).label;
                            }
                        }
                        if (target != null) {
                            Block tar = target.block;
                            b.addEdge(tar);
                        }
                    }
                }
            }
        }
    }

    public static void ControlFlowGraph(SPIMCode code) {
        markLeader(code);
        cutFuncBlocks(code);
        addEdges(code);
    }
}

package gen.spim;

import gen.advanced.SPIMInfRegister;
import gen.spim.spimcfg.Block;
import gen.spim.spimcfg.Graph;

import java.util.HashSet;

/**
 * Created by Robbin Ni on 2015/5/27.
 */
public class SPIMLiveness {

    public static void addDef(SPIMValue val, Block b) {
        if (val instanceof SPIMInfRegister) {
            SPIMInfRegister reg = (SPIMInfRegister)val;
            if (!b.def.contains(reg)) {
                b.def.add(reg);
            }
        }
    }

    public static void addUse(SPIMValue val, Block b) {
        if (val instanceof SPIMInfRegister) {
            SPIMInfRegister reg = (SPIMInfRegister)val;
            if (!b.def.contains(reg) && !b.use.contains(reg)) {
                b.use.add(reg);
            }
        }
    }

    public static void calUsage(Block b) {
        b.def = new HashSet<>();
        b.use = new HashSet<>();
        for (SPIMInst inst : b.insts) {
            if (inst.label != null) {
                continue;
            }
            if (inst.op.use > 0 && inst.op.def < 1) {
                addUse(inst.val0, b);
            }
            if (inst.op.use > 1 && inst.op.def < 2) {
                addUse(inst.val1, b);
            }
            if (inst.op.use > 2 && inst.op.def < 3) {
                addUse(inst.val2, b);
            }
            if (inst.op.def > 0) {
                addDef(inst.val0, b);
            }
            if (inst.op.def > 1) {
                addDef(inst.val1, b);
            }
            if (inst.op.def > 2) {
                addDef(inst.val2, b);
            }
        }
    }

    public static void calLive(Graph g) {

        class anonymous {
            public void propPrec(Block u, SPIMInfRegister reg) {
                if (u.liveIn.contains(reg)) {
                    return;
                }
                u.liveIn.add(reg);
                for (Block v : u.prec) {
                    if (v.liveOut.contains(reg)) {
                        continue;
                    }
                    v.liveOut.add(reg);
                    if (!v.def.contains(reg)) {
                        propPrec(v, reg);
                    }
                }
            }

        }
        for (Block block : g.blocks) {
            block.liveIn = new HashSet<>();
            block.liveOut = new HashSet<>();
        }
        anonymous tmp = new anonymous();
        for (Block block : g.blocks) {
            for (SPIMInfRegister reg : block.use)  {
                tmp.propPrec(block, reg);
            }
        }
    }

    public static void LivenessAnalysis(SPIMCode code) {
        for (Graph g : code.graphs) {
            for (Block b : g.blocks) {
                calUsage(b);
            }
            calLive(g);
        }
    }

    static public String print(SPIMCode code) {
        String ret = "";
        int gCnt = 0;
        for (Graph g : code.graphs) {
            ret += "Graph : " + gCnt++ + "\n";
            int bCnt = 0;
            for (Block b : g.blocks) {
                ret += "Block : " + bCnt++ + b + "\n";
                for (SPIMInst inst : b.insts) {
                    ret += inst.print() + "\n";
                }
                for (Block b1 : b.succ) {
                    ret += "Edge To" + b1 + "\n";
                }
                ret += "Def:\n";
                for (SPIMInfRegister reg : b.def) {
                    ret += reg.print() + "\n";
                }
                ret += "Use:\n";
                for (SPIMInfRegister reg : b.use) {
                    ret += reg.print() + "\n";
                }
                ret += "LiveIn:\n";
                for (SPIMInfRegister reg : b.liveIn) {
                    ret += reg.print() + "\n";
                }
                ret += "LiveOut:\n";
                for (SPIMInfRegister reg : b.liveOut) {
                    ret += reg.print() + "\n";
                }
            }
        }
        return ret;
    }
}

package analysis;

import analysis.cfg.Block;
import mir.*;

import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class CopyPropagation {

    void defCut(VarName var, HashSet<AssignCopyPair> acps) {
        LinkedList<AssignCopyPair> remove = new LinkedList<>();
        for (AssignCopyPair acp : acps) {
            if (acp.u.equals(var) || acp.v.equals(var)) {
                remove.add(acp);
            }
        }
        for (AssignCopyPair acp: remove) {
            acps.remove(acp);
        }
    }

    void defCut(MIRInst inst, HashSet<AssignCopyPair> acps) {
        if (inst instanceof AssignInst) {
            defCut(((AssignInst) inst).dest, acps);
            if (((AssignInst) inst).op.equals(ExprOp.adr)) {
                defCut((VarName)(((AssignInst) inst).src1), acps);
            }
        } else if (inst instanceof CallInst)  {
            if (((CallInst)inst).dest != null) {
                defCut(((CallInst) inst).dest, acps);
            }
        } else if (inst instanceof MemInst) {
            defCut(((MemInst) inst).var, acps);
        } else if (inst instanceof RecvInst) {
            defCut(((RecvInst) inst).var, acps);
        }
    }
    void calBlock(Block b) {
        b.genCopy = new HashSet<>();
        for (MIRInst inst : b.insts) {
            replaceCopy(inst, b.genCopy);
            defCut(inst, b.genCopy);
            if (inst instanceof AssignInst && ((AssignInst) inst).op.equals(ExprOp.asg)) {
                AssignInst assi = (AssignInst)inst;
                if (assi.src1 instanceof VarName && !(assi.src1 instanceof DeRefVar) && !(assi.dest instanceof DeRefVar) && ((AssignInst) inst).dest.size == ((AssignInst) inst).src1.size) {
                    b.genCopy.add(AssignCopyPair.getACP(assi.dest, (VarName)assi.src1));
                }
            }
        }
    }

    void calCopy(ProgUnit unit) {

        class anonymous {
            public void propSucc(Block u, AssignCopyPair acp) {
                if (!u.inCopy.contains(acp)) {
                    return;
                }
                u.inCopy.remove(acp);
                if (u.genCopy.contains(acp)) {
                    return;
                }
                u.outCopy.remove(acp);
                for (Block v : u.succ) {
                    if (!v.inCopy.contains(acp)) {
                        continue;
                    }
                    propSucc(v, acp);
                }
            }

        }

        unit.graph.allACP = new HashSet<>();
        for (Block b : unit.graph.ver) {
            calBlock(b);
            unit.graph.allACP.addAll(b.genCopy);
        }

        for (Block b : unit.graph.ver) {
            b.inCopy = (HashSet<AssignCopyPair>)unit.graph.allACP.clone();
            b.outCopy = (HashSet<AssignCopyPair>)unit.graph.allACP.clone();
        }

        anonymous tmp = new anonymous();
        for (AssignCopyPair acp : unit.graph.allACP) {
            tmp.propSucc(unit.graph.ver.get(0), acp);
        }
        for (Block b : unit.graph.ver) {
            LinkedList<AssignCopyPair> remove = new LinkedList<>();
            for (AssignCopyPair acp : b.inCopy) {
                if ((b.def.contains(acp.v) || b.def.contains(acp.u)) && !b.genCopy.contains(acp)) {
                    remove.add(acp);
                }
            }
            for (AssignCopyPair acp : remove) {
                tmp.propSucc(b, acp);
            }
        }
    }

    VarName getCopy(VarName u, HashSet<AssignCopyPair> acps) {
        if (u instanceof DeRefVar && ((DeRefVar) u).val instanceof VarName) {
            ((DeRefVar) u).val = getCopy((VarName)((DeRefVar) u).val, acps);
        }
        for (AssignCopyPair acp : acps) {
            if (acp.u.equals(u)) {
                return acp.v;
            }
        }
        return u;
    }

    void replaceCopy(MIRInst inst, HashSet<AssignCopyPair> acps) {
        if (inst instanceof AssignInst) {
            AssignInst assi = (AssignInst)inst;
            if (assi.src1 != null && assi.src1 instanceof VarName) {
                assi.src1 = getCopy((VarName)assi.src1, acps);
            }
            if (assi.src2 != null && assi.src2 instanceof VarName) {
                assi.src2 = getCopy((VarName)assi.src2, acps);
            }
        } else if (inst instanceof IfInst) {
            IfInst ifin = (IfInst)inst;
            if (ifin.src1 != null && ifin.src1 instanceof VarName) {
                ifin.src1 = getCopy((VarName)ifin.src1, acps);
            }
            if (ifin.src2 != null && ifin.src2 instanceof VarName) {
                ifin.src2 = getCopy((VarName)ifin.src2, acps);
            }
        } else if (inst instanceof CallInst) {
            CallInst call = (CallInst)inst;
            if (call.func instanceof VarName) {
                call.func = getCopy((VarName)call.func, acps);
            }
        } else if (inst instanceof ParaInst) {
            ParaInst para = (ParaInst)inst;
            if (para.val != null && para.val instanceof VarName) {
                para.val = getCopy((VarName) para.val, acps);
            }
        }
    }

    ProgUnit replaceCopy(ProgUnit unit) {
        for (Block b : unit.graph.ver) {
            HashSet<AssignCopyPair> acp = (HashSet<AssignCopyPair>)(b.inCopy.clone());
            for (MIRInst inst : b.insts) {
                replaceCopy(inst, acp);
                defCut(inst, acp);
                if (inst instanceof AssignInst && ((AssignInst) inst).op.equals(ExprOp.asg)) {
                    AssignInst assi = (AssignInst)inst;
                    if (assi.src1 instanceof VarName && !(assi.src1 instanceof DeRefVar) && !(assi.dest instanceof DeRefVar) && ((AssignInst) inst).dest.size == ((AssignInst) inst).src1.size) {
                        acp.add(AssignCopyPair.getACP(assi.dest, (VarName) assi.src1));
                    }
                }
            }
        }
        return unit;
    }

    public Program CopyPropagation(Program prog) {
        AssignCopyPair.reset();
        for (ProgUnit unit : prog.list) {
            calCopy(unit);
        }
        for (ProgUnit unit : prog.list) {
            replaceCopy(unit);
        }
        return prog;
    }
}

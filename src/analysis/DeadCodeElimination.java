package analysis;

import analysis.cfg.Block;
import mir.*;

import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class DeadCodeElimination {

    LinkedList<HashSet<VarName>> liveList;

    void cutDef(MIRInst inst, HashSet<VarName> cur) {
        if (inst instanceof AssignInst) {
            VarName var = ((AssignInst) inst).dest;
            if (var instanceof DeRefVar) {
                addUseVar((VarName)(((DeRefVar) var).val), cur);
            }
            cur.remove(((AssignInst) inst).dest);
        } else if (inst instanceof CallInst)  {
            if (((CallInst) inst).dest != null) {
                VarName var = ((CallInst) inst).dest;
                if (var instanceof DeRefVar) {
                    addUseVar((VarName) (((DeRefVar) var).val), cur);
                    addUseVar((VarName) (((DeRefVar) var).val), liveList.peek());
                }
                cur.remove(((CallInst) inst).dest);
            }
        } else if (inst instanceof MemInst) {
            cur.remove(((MemInst) inst).var);
        } else if (inst instanceof RecvInst) {
            cur.remove(((RecvInst) inst).var);
        }
    }

    void addUseVar(VarName var, HashSet<VarName> cur) {
        //TODO : TYPE HAZARD!!!
        if (var instanceof DeRefVar) {
            var = (VarName)((DeRefVar) var).val;
        }
        cur.add(var);
    }

    void addUse(MIRInst inst, HashSet<VarName> cur) {
        if (inst instanceof AssignInst) {
            AssignInst assi = (AssignInst)inst;
            if (assi.src1 != null && assi.src1 instanceof VarName) {
                addUseVar((VarName) assi.src1, cur);
            }
            if (assi.src2 != null && assi.src2 instanceof VarName) {
                addUseVar((VarName) assi.src2, cur);
            }
        } else if (inst instanceof IfInst) {
            IfInst ifin = (IfInst)inst;
            if (ifin.src1 != null && ifin.src1 instanceof VarName) {
                addUseVar((VarName) ifin.src1, cur);
            }
            if (ifin.src2 != null && ifin.src2 instanceof VarName) {
                addUseVar((VarName) ifin.src2, cur);
            }
        } else if (inst instanceof CallInst) {
            CallInst call = (CallInst)inst;
            if (call.func instanceof VarName) {
                addUseVar((VarName) call.func, cur);
            }
        } else if (inst instanceof ParaInst) {
            ParaInst para = (ParaInst)inst;
            if (para.val != null && para.val instanceof VarName) {
                addUseVar((VarName)para.val, cur);
            }
        }
    }

    void calLive(Block b) {
        HashSet<VarName> cur = b.liveOut;
        for (int i = b.insts.size() - 1; i >= 0; --i) {
            liveList.push(cur);
            cur = (HashSet<VarName>)(cur.clone());
            if (b.insts.get(i) instanceof CallInst) {
                CallInst call = (CallInst)(b.insts.get(i));
                int num = ((IntConst)call.num).val;
                cutDef(b.insts.get(i), cur);
                addUse(b.insts.get(i), cur);
                for (int j = 1; j <= num; ++j) {
                    addUse(b.insts.get(i - j), cur);
                    addUse(b.insts.get(i - j), liveList.peek());
                }
                i -= num;
            } else {
                cutDef(b.insts.get(i), cur);
                addUse(b.insts.get(i), cur);
            }
        }
    }

    public MIRInst emptyReplace(MIRInst inst) {
        MIRInst empty = (new EmptyInst()).setLabel(inst.label);
        if (empty.label != null) {
            empty.label.inst = empty;
        }
        return empty;
    }

    public MIRInst eliminate(MIRInst inst, HashSet<VarName> cur) {
        if (inst instanceof AssignInst) {
            VarName var = ((AssignInst) inst).dest;
            if (!(var instanceof DeRefVar) && !(cur.contains(var) || var.isRet || var.uid == 0)) {
                return emptyReplace(inst);
            }
        } else if (inst instanceof CallInst)  {
            if (((CallInst) inst).dest != null) {
                VarName var = ((CallInst) inst).dest;
                if (!(var instanceof DeRefVar) && !(cur.contains(var) || var.isRet || var.uid == 0)) {
                    ((CallInst) inst).dest = null;
                }
            }
        }
        return inst;
    }

    public ProgUnit eliminate(ProgUnit unit) {
        ProgUnit unit1 = new ProgUnit(unit.label);
        liveList = new LinkedList<>();
        for (Block b : unit.graph.ver) {
            calLive(b);
            HashSet<VarName> calls = null;
            for (MIRInst inst : b.insts) {
                if (inst instanceof ParaInst) {
                    if (calls == null) {
                        calls = liveList.pop();
                    }
                }
                if (calls == null) {
                    unit1.addInst(eliminate(inst, liveList.pop()));
                } else {
                    unit1.addInst(eliminate(inst, calls));
                    if (inst instanceof CallInst) {
                        calls = null;
                    }
                }
            }
        }
        unit1.dummyCut();
        return unit1;
    }

    public Program DeadCodeElimination(Program prog) {
        Program eliminated = new Program();
        for (ProgUnit unit : prog.list) {
            eliminated.addUnit(eliminate(unit));
        }
        return eliminated;
    }
}

package analysis;

import analysis.cfg.Block;
import analysis.cfg.Graph;
import mir.*;

import java.util.HashSet;

/**
 * Created by Robbin Ni on 2015/5/10.
 */
public class LivenessAnalysis {

    public static void addUse(VarName var, Block b) {
        if (b.def.contains(var) || b.use.contains(var)) {
            return;
        }
        b.use.add(var);
    }

    public static void addDef(VarName var, Block b) {
        if (b.def.contains(var)) {
            return;
        }
        b.def.add(var);
    }

    public static void calUsage(Block b) {
        b.def = new HashSet<>();
        b.use = new HashSet<>();
        for (MIRInst inst : b.insts) {
            if (inst instanceof AssignInst) {
                AssignInst assi = (AssignInst)inst;
                if (assi.src1 != null && assi.src1 instanceof VarName) {
                    addUse((VarName) assi.src1, b);
                }
                if (assi.src2 != null && assi.src2 instanceof VarName) {
                    addUse((VarName) assi.src2, b);
                }
            } else if (inst instanceof IfInst) {
                IfInst ifin = (IfInst)inst;
                if (ifin.src1 != null && ifin.src1 instanceof VarName) {
                    addUse((VarName) ifin.src1, b);
                }
                if (ifin.src2 != null && ifin.src2 instanceof VarName) {
                    addUse((VarName) ifin.src2, b);
                }
            } else if (inst instanceof CallInst) {
                CallInst call = (CallInst)inst;
                if (call.func instanceof VarName) {
                    addUse((VarName) call.func, b);
                }
            } else if (inst instanceof ParaInst) {
                ParaInst para = (ParaInst)inst;
                if (para.val != null && para.val instanceof VarName) {
                    addUse((VarName) para.val, b);
                }
            }
            if (inst instanceof AssignInst) {
                addDef(((AssignInst) inst).dest, b);
            } else if (inst instanceof CallInst)  {
                if (((CallInst)inst).dest != null) {
                    addDef(((CallInst) inst).dest, b);
                }
            } else if (inst instanceof MemInst) {
                addDef(((MemInst) inst).var, b);
            } else if (inst instanceof RecvInst) {
                addDef(((RecvInst) inst).var, b);
            }
        }
    }

    public static void calLive(Graph g) {

        class anonymous {
            public void propPrec(Block u, VarName var) {
                if (u.liveIn.contains(var)) {
                    return;
                }
                u.liveIn.add(var);
                for (Block v : u.prec) {
                    if (v.liveOut.contains(var)) {
                        continue;
                    }
                    v.liveOut.add(var);
                    if (!v.def.contains(var)) {
                        propPrec(v, var);
                    }
                }
            }

        }
        for (Block block : g.ver) {
            block.liveIn = new HashSet<>();
            block.liveOut = new HashSet<>();
        }
        anonymous tmp = new anonymous();
        for (Block block : g.ver) {
            for (VarName var : block.use)  {
                tmp.propPrec(block, var);
            }
        }
    }


    static public void cal(ProgUnit unit) {
        for (Block block : unit.graph.ver) {
            calUsage(block);
        }
        calLive(unit.graph);
    }


    static public void cal(Program prog) {
        for (ProgUnit unit : prog.list) {
            cal(unit);
        }
    }

    static public String printLive(Block b) {
        String ret = "Vertex " + b.id + "\n";
        ret += "Def:\n";
        for (VarName var : b.def) {
            ret += var.name + "  ";
        }
        ret += "\nUse:\n";
        for (VarName var : b.use) {
            ret += var.name + "  ";
        }
        ret += "\nIn:\n";
        for (VarName var : b.liveIn) {
            ret += var.name + "  ";
        }
        ret += "\nOut:\n";
        for (VarName var : b.liveOut) {
            ret += var.name + "  ";
        }
        return ret + "\n";
    }

    static public String printLive(ProgUnit unit) {
        String ret = "\\\\" + unit.label.name + "\n";
        for (Block block : unit.graph.ver)  {
            ret += printLive(block);
        }
        return ret;
    }

    static public String printLive(Program prog) {
        String ret = "";
        for (ProgUnit unit : prog.list) {
            ret += printLive(unit);
        }
        return ret;
    }
}

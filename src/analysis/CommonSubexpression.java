package analysis;

import analysis.cfg.Block;
import mir.*;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class CommonSubexpression {

    void addSub(MIRInst inst, Block b) {
        if (inst instanceof AssignInst) {
            AssignInst assi = (AssignInst)inst;
            if (assi.op.cnt == 2) {
                Subexpression exp = Subexpression.getSubexp(assi.op, assi.src1, assi.src2);
                b.whereSub.put(exp, assi);
                b.genSub.add(exp);
                if (assi.op.changeable()) {
                    Subexpression exp1 = Subexpression.getSubexp(assi.op, assi.src2, assi.src1);
                    b.whereSub.put(exp1, assi);
                    b.genSub.add(exp1);
                }
            }
        }

    }

    void defCut(VarName var, Block b) {
        LinkedList<Subexpression> exps = new LinkedList<>();
        for (Subexpression exp : b.genSub) {
            if (exp.val1.equals(var) || exp.val2.equals(var)) {
                exps.add(exp);
            }
        }
        for (Subexpression exp : exps) {
            b.genSub.remove(exp);
            b.whereSub.remove(exp);
        }
    }

    void defCut(MIRInst inst, Block b) {
        if (inst instanceof AssignInst) {
            defCut(((AssignInst) inst).dest, b);
        } else if (inst instanceof CallInst)  {
            if (((CallInst)inst).dest != null) {
                defCut(((CallInst) inst).dest, b);
            }
        } else if (inst instanceof MemInst) {
            defCut(((MemInst) inst).var, b);
        } else if (inst instanceof RecvInst) {
            defCut(((RecvInst) inst).var, b);
        }
    }

    void calBlock(Block b) {
        b.genSub = new HashSet<>();
        b.whereSub = new HashMap<>();
        for (MIRInst inst : b.insts) {
            addSub(inst, b);
            defCut(inst, b);
        }
    }

    void calUnit(ProgUnit unit) {

        class anonymous {
            public void propSucc(Block u, Subexpression exp) {
                if (!u.inSub.contains(exp)) {
                    return;
                }
                u.inSub.remove(exp);
                if (u.genSub.contains(exp)) {
                    return;
                }
                u.outSub.remove(exp);
                for (Block v : u.succ) {
                    if (!v.inSub.contains(exp)) {
                        continue;
                    }
                    propSucc(v, exp);
                }
            }

        }

        unit.graph.allExp = new HashSet<>();
        for (Block b : unit.graph.ver) {
            calBlock(b);
            unit.graph.allExp.addAll(b.genSub);
        }

        for (Block block : unit.graph.ver) {
            block.inSub = (HashSet<Subexpression>)unit.graph.allExp.clone();
            block.outSub = (HashSet<Subexpression>)unit.graph.allExp.clone();
        }
        anonymous tmp = new anonymous();
        for (Subexpression exp : unit.graph.allExp) {
            tmp.propSucc(unit.graph.ver.get(0), exp);
        }
        for (Block block : unit.graph.ver) {
            for (VarName def : block.def) {
                LinkedList<Subexpression> erase = new LinkedList<>();
                for (Subexpression exp : block.inSub) {
                    if (exp.val1.equals(def) || exp.val2.equals(def)) {
                        erase.add(exp);
                    }
                }
                for (Subexpression exp : erase) {
                    tmp.propSucc(block, exp);
                }
            }
        }

    }

    public void calCommonSubexpression(Program prog) {
        Subexpression.reset();
        for (ProgUnit unit : prog.list) {
            calUnit(unit);
        }
    }

    public String printCommonSubexpression(Program prog) {
        String ret = "";
        for (ProgUnit unit : prog.list) {
            ret += unit.label.name + "\n";
            for (Block b : unit.graph.ver) {
                ret += b.print();
                ret += "Gen\n";
                for (Subexpression exp : b.genSub) {
                    ret += exp.print() + "\n";
                }
                ret += "inSub\n";
                for (Subexpression exp : b.inSub) {
                    ret += exp.print() + "\n";
                }
                ret += "outSub\n";
                for (Subexpression exp : b.outSub) {
                    ret += exp.print() + "\n";
                }
            }
        }
        return ret;
    }

    public Program replaceCommonSubexpression(Program prog) {
        Program replaced = new Program();
        for (ProgUnit unit : prog.list) {
            replaced.addUnit(replaceUnit(unit));
        }
        return replaced;
    }

    public Subexpression getUse(MIRInst inst) {
        if (inst instanceof AssignInst) {
            AssignInst assi = (AssignInst) inst;
            if (assi.op.cnt == 2) {
                return Subexpression.getSubexp(assi.op, assi.src1, assi.src2);
            }
        }
        return null;
    }

    VarName getCut(MIRInst inst) {
        if (inst instanceof AssignInst) {
            return ((AssignInst) inst).dest;
        } else if (inst instanceof CallInst)  {
            if (((CallInst)inst).dest != null) {
                return ((CallInst) inst).dest;
            }
        } else if (inst instanceof MemInst) {
            return ((MemInst) inst).var;
        } else if (inst instanceof RecvInst) {
            return ((RecvInst) inst).var;
        }
        return null;
    }

    public void replaceInst(AssignInst inst, Subexpression exp, VarName tmp) {
        if (inst.insertedNext == null) {
            AssignInst inserted = new AssignInst(exp.op, tmp, exp.val1, exp.val2);
            inst.insertedNext = inserted;
            inserted.label = inst.label;
            if (inst.label != null) {
                inst.label.inst = inserted;
            }
            inst.insertedNext.insertedNext = new AssignInst(ExprOp.asg, inst.dest, tmp);
        }
    }

    HashSet<Block> visited;

    public void replaceBlock(Block b, Subexpression exp, VarName var) {
        if (visited.contains(b)) {
            return;
        }
        visited.add(b);
        if (b.genSub.contains(exp)) {
            AssignInst inst = b.whereSub.get(exp);
            if (inst.insertedNext == null) {
                replaceInst(inst, exp, var);
            }
            return;
        }
        for (Block b1 : b.prec) {
            replaceBlock(b1, exp, var);
        }
    }

    public ProgUnit replaceUnit(ProgUnit unit) {
        HashMap<Subexpression, VarName> temps = new HashMap<>();
        for (Block b : unit.graph.ver) {
            HashSet<Subexpression> avli = (HashSet<Subexpression>)b.inSub.clone();
            HashMap<Subexpression, AssignInst> inBlock = new HashMap<>();
            for (MIRInst inst : b.insts) {
                Subexpression exp = getUse(inst);
                if (exp != null) {
                    if (avli.contains(exp)) {
                        //System.out.println(exp.print());
                        VarName tmp = null;
                        if (temps.containsKey(exp)) {
                            tmp = temps.get(exp);
                        } else {
                            tmp = VarName.getTmp();
                            temps.put(exp, tmp);
                        }
                        if (inBlock.containsKey(exp)) {
                            AssignInst assi = inBlock.get(exp);
                            replaceInst(assi, exp, tmp);
                        } else {
                            visited = new HashSet<>();
                            for (Block b1 : b.prec) {
                                replaceBlock(b1, exp, tmp);
                            }
                        }
                        inst.insertedNext = new AssignInst(ExprOp.asg, ((AssignInst)inst).dest, tmp);
                        inst.insertedNext.label = inst.label;
                        if (inst.label != null) {
                            inst.label.inst = inst.insertedNext;
                        }
                    } else {
                        avli.add(exp);
                        inBlock.put(exp, (AssignInst)inst);
                    }
                }
                VarName def = getCut(inst);
                if (def != null) {
                    LinkedList<Subexpression> exps = new LinkedList<>();
                    for (Subexpression exp1 : avli) {
                        if (exp1.val1.equals(def) || exp1.val2.equals(def)) {
                            exps.add(exp1);
                        }
                    }
                    for (Subexpression exp1 : exps) {
                        avli.remove(exp1);
                        inBlock.remove(exp1);
                    }
                }
            }
        }

        ProgUnit unit1 = new ProgUnit(unit.label);
        for (MIRInst inst : unit.list) {
            if (inst.insertedNext == null) {
                unit1.addInst(inst);
                inst.isLeader = false;
                inst.block = null;
            } else {
                MIRInst addi = inst.insertedNext;
                while (addi != null) {
                    unit1.addInst(addi);
                    MIRInst tmp = addi.insertedNext;
                    addi.insertedNext = null;
                    addi = tmp;
                }
            }
        }
        return unit1;
    }

}

package gen.advanced;

import analysis.cfg.Block;
import ast.nodes.expression.*;
import gen.spim.*;
import mir.*;
import mir.CharConst;
import mir.IntConst;
import mir.StringConst;

import java.util.*;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class CodeSelect {

    SPIMCode code;

    int strCnt;

    HashMap<Integer, SPIMLabel> labels;

    SPIMLabel getLabel(String s) {
        if (labels.containsKey(Symbol.getnum(s))) {
            return labels.get(Symbol.getnum(s));
        } else {
            SPIMLabel ret = new SPIMLabel(s);
            labels.put(Symbol.getnum(s), ret);
            return ret;
        }
    }

    HashMap<Integer, SPIMAddress> strs;

    SPIMAddress getStringConst(String s) {
        if (strs.containsKey(Symbol.getnum(s))) {
            return strs.get(Symbol.getnum(s));
        }
        String trans = "\"";
        for (int i = 0; i < s.length(); ++i) {
            if (s.charAt(i) == '\n') {
                trans += "\\n";
            } else if (s.charAt(i) == '\t') {
                trans += "\\t";
            } else if (s.charAt(i) == '\"') {
                trans += "\\\"";
            } else {
                trans += s.charAt(i);
            }
        }
        trans += "\"";
        SPIMLabel label = new SPIMLabel("_str" + (strCnt++));
        code.addData(label.label + ":\t\t.asciiz\t" + trans);
        strs.put(Symbol.getnum(s), new SPIMAddress(label));
        return strs.get(Symbol.getnum(s));
    }

    AdvEnvr envr;

    HashMap<SPIMRegister, RegisterStatus> regs;
    HashMap<VarName, AddressDescription> vars;

    void setGlobalBond(VarName var) {
        if (var.uid == 0 && envr.bond.containsKey(var)) {
            SPIMRegister reg = envr.bond.get(var);
            regs.put(reg, new RegisterStatus());
            regs.get(reg).addVar(var);
            vars.get(var).addReg(reg);
            vars.get(var).inmem = false;
        }
    }

    void setGlobalBonds() {
        for (VarName var : envr.bond.keySet()) {
            if (var.uid == 0) {
                SPIMRegister reg = envr.bond.get(var);
                regs.put(reg, new RegisterStatus());
                regs.get(reg).addVar(var);
                if (!vars.containsKey(var)) {
                    vars.put(var, new AddressDescription(globalVar.get(var)));
                }
                vars.get(var).addReg(reg);
                vars.get(var).inmem = false;
            }
        }
    }

    void synchronGlobalBonds() {
        for (VarName var : envr.bond.keySet()) {
            if (var.uid != 0) {
                continue;
            }
            SPIMRegister reg = envr.bond.get(var);
            if (!vars.get(var).regs.contains(reg)) {
                if (vars.get(var).inmem) {
                    code.addText(new SPIMInst(var.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr(var)));
                } else {
                    SPIMRegister reg1 = vars.get(var).regs.iterator().next();
                    code.addText(new SPIMInst(SPIMOp.move, reg, reg1));
                }
                vars.get(var).addReg(reg);
                regs.get(reg).addVar(var);
                vars.get(var).inmem = false;
            }
        }
    }

    void saveGlobalUnbonded() {
        for (VarName var : vars.keySet()) {
            if (var.uid == 0 && !vars.get(var).inmem && !var.isTemp && !envr.bond.containsKey(var)) {
                SPIMRegister reg = vars.get(var).regs.iterator().next();
                code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, getAddr(var)));
                vars.get(var).inmem = true;
            }
        }
    }

    HashMap<VarName, SPIMAddress> globalVar;

    void addGlobal(ProgUnit global) {
        globalVar = new HashMap<>();
        code.addText(new SPIMInst(new SPIMLabel("main")));
        curDelta = 0;
        curPara = new HashMap<>();
        curlive = new HashSet<VarName>();
        for (MIRInst inst : global.list) {
            if (inst instanceof ReturnInst) {
                saveGlobalUnbonded();
                code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(new SPIMLabel("__main"))));
            } else if (inst instanceof MemInst) {
                MemInst mem = (MemInst)inst;
                code.addData("\t\t.align\t" + mem.var.align);
                code.addData("\t\t.extern\t" + mem.var.name + "\t" + mem.size);
                code.addData(mem.var.name + ":\t\t" + ".space" + "\t" + mem.size);
                globalVar.put(mem.var, (new SPIMAddress(new SPIMLabel(mem.var.name))));
                vars.put(mem.var, (new AddressDescription(new SPIMAddress(new SPIMLabel(mem.var.name)))));
                vars.get(mem.var).inmem = true;
                setGlobalBond(mem.var);
            } else {
                genInst(inst, new HashSet<VarName>());
            }
        }
        regs.clear();
        vars.clear();
    }

    int curDelta;
    LinkedList<Value> pStack;
    HashMap<VarName, SPIMRegister> curPara;

    boolean hasCall;

    boolean isInlineFunc(CallInst inst) {
        if (inst.func.name.equals("___printf")) {
            if (((IntConst)inst.num).val == 1) {
                return true;
            }
        }
        if (inst.func.name.equals("___getchar")) {
            return true;
        } else if (inst.func.name.equals("___malloc")) {
            return true;
        }
        return false;
    }

    void addFunc(ProgUnit func) {
        curDelta = 4;
        pStack = new LinkedList<>();
        curPara = new HashMap<>();
        SPIMLabel entry = getLabel(func.label.name);
        code.addText(new SPIMInst(entry));
        hasCall = false;
        for (MIRInst inst : func.list) {
            if (inst instanceof CallInst && !isInlineFunc((CallInst)inst)){
                hasCall = true;
                break;
            }
        }
        if (hasCall) {
            code.addText(new SPIMInst(SPIMOp.sw, SPIMRegID.$ra.getReg(), new SPIMAddress(SPIMImmediate.getImmi(-4), SPIMRegID.$sp.getReg())));
        }
        for (Block b : func.graph.ver) {
            genBlock(b);
        }
        vars.clear();
    }

    void setArguBonds(HashSet<VarName> live) {
        for (VarName var : live) {
            SPIMRegister reg = null;
            if (envr.bond.containsKey(var)) {
                reg = envr.bond.get(var);
            } else if (curPara.containsKey(var)) {
                reg = curPara.get(var);
            } else {
                continue;
            }
            if (!regs.containsKey(reg)) {
                regs.put(reg, new RegisterStatus());
            }
            regs.get(reg).addVar(var);
            if (!vars.containsKey(var)) {
                throw new InternalError("Undefined variable being set up in the register.\n");
            }
            vars.get(var).addReg(reg);
            vars.get(var).inmem = false;
        }
    }

    void synchronArguBond(HashSet<VarName> live) {
        for (VarName var : live) {
            SPIMRegister reg = null;
            if (envr.bond.containsKey(var)) {
                reg = envr.bond.get(var);
            } else if (curPara.containsKey(var)) {
                reg = curPara.get(var);
            } else {
                continue;
            }
            if (!regs.containsKey(reg)) {
                regs.put(reg, new RegisterStatus());
            }
            if (!vars.get(var).regs.contains(reg)) {
                if (vars.get(var).inmem) {
                    code.addText(new SPIMInst(var.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr(var)));
                } else {
                    SPIMRegister reg1 = vars.get(var).regs.iterator().next();
                    code.addText(new SPIMInst(SPIMOp.move, reg, reg1));
                }
                vars.get(var).addReg(reg);
                regs.get(reg).addVar(var);
                vars.get(var).inmem = false;
            }
        }
    }

    void saveCall() {
        //save every thing other than global bonded
        for (SPIMRegister reg : regs.keySet()) {
            RegisterStatus regSt = regs.get(reg);
            LinkedList<VarName> removed = new LinkedList<>();
            for (VarName var : regSt.vars) {
                if (var.uid == 0 && envr.bond.containsKey(var) && envr.bond.get(var).equals(reg)) {
                    continue;
                }
                removed.add(var);
                if ((curlive.contains(var) || var.uid == 0) && !vars.get(var).inmem) {
                    code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, getAddr((VarName)var)));
                    vars.get(var).inmem = true;
                }
                vars.get(var).delReg(reg);
            }
            for (VarName var : removed) {
                regSt.delVar(var);
            }
        }
    }

    void saveReturnValue() {
        for (VarName var : vars.keySet()) {
            if (var.isRet && vars.get(var).regs.size() > 0) {
                if (!vars.get(var).regs.contains(SPIMRegID.$v0.getReg())) {
                    SPIMRegister reg1 = vars.get(var).regs.iterator().next();
                    code.addText(new SPIMInst(SPIMOp.move, SPIMRegID.$v0.getReg(), reg1));
                }
            }
        }
    }

    void saveNonArguBondRegs(HashSet<VarName> live) {
        for (VarName var : live) {
            if (envr.bond.containsKey(var) || curPara.containsKey(var) || !vars.containsKey(var) || vars.get(var).inmem) {
                continue;
            }
            code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, vars.get(var).regs.iterator().next(), getAddr(var)));
            vars.get(var).inmem = true;
        }
    }

    void genBlock(Block b) {
        if (b.id != 0) {
            liveList = new LinkedList<>();
            calLive(b); //TODO may TLE
            setGlobalBonds();
            setArguBonds(b.liveIn);
            MIRInst jump = null;
            HashSet<VarName> jumps = null;
            for (MIRInst inst : b.insts) {
                if (inst instanceof BranchInst) {
                    jump = inst;
                    jumps = liveList.pop();
                    break;
                }
                genInst(inst, liveList.pop());
            }
            synchronGlobalBonds();
            synchronArguBond(b.liveOut);
            saveNonArguBondRegs(b.liveOut);
            saveGlobalUnbonded();
            if (jump != null) {
                genInst(jump, jumps);
            }
            regs.clear();
            for (VarName var : vars.keySet()) {
                vars.get(var).regs.clear();
            }
        }
    }

    LinkedList<HashSet<VarName>> liveList;

    void cutDef(MIRInst inst, HashSet<VarName> cur) {
        if (inst instanceof AssignInst) {
            VarName var = ((AssignInst) inst).dest;
            if (var instanceof DeRefVar) {
                addUseVar((VarName)((DeRefVar) var).val, cur);
            }
            cur.remove(((AssignInst) inst).dest);
        } else if (inst instanceof CallInst)  {
            if (((CallInst) inst).dest != null) {
                VarName var = ((CallInst) inst).dest;
                if (var instanceof DeRefVar) {
                    addUseVar((VarName)((DeRefVar) var).val, cur);
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
            cutDef(b.insts.get(i), cur);
            addUse(b.insts.get(i), cur);
        }
    }

    HashSet<VarName> curlive;

    SPIMAddress getAddr(VarName var) {
        if (var instanceof DeRefVar) {
            return new SPIMAddress(loadToReg(((DeRefVar) var).val));
        }
        if (!vars.containsKey(var)) {
            if (var.uid == 0) {
                vars.put(var, (new AddressDescription(globalVar.get(var))));
                vars.get(var).inmem = !envr.bond.containsKey(var);
            } else {
                curDelta = alignTo(curDelta, var.align);
                curDelta += var.size;
                vars.put(var, (new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg()))));
                vars.get(var).inmem = false;
            }
        }
        return vars.get(var).mem;
    }

    void saveRegMem(SPIMRegister reg) {
        if (!regs.containsKey(reg)) {
            return;
        }
        RegisterStatus regSt = regs.get(reg);
        for (VarName var : regSt.vars) {
            if ((curlive.contains(var) || var.uid == 0) && vars.containsKey(var) && !vars.get(var).inmem && vars.get(var).regs.size() == 1) {
                if (envr.bond.containsKey(var) && var.uid == 0) {
                    SPIMRegister reg1 = envr.bond.get(var);
                    code.addText(new SPIMInst(SPIMOp.move, reg1, reg));
                    regs.get(reg1).addVar(var);
                    vars.get(var).addReg(reg1);
                } else {
                    code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, getAddr(var)));
                    vars.get(var).inmem = true;
                }
            }
        }
    }

    void clearReg(SPIMRegister reg) {
        if (regs.containsKey(reg)) {
            for (VarName var : regs.get(reg).vars) {
                vars.get(var).delReg(reg);
            }
            regs.get(reg).vars.clear();
        }
    }

    void saveReg(SPIMRegister reg) {
        if (regs.containsKey(reg)) {
            int alias = 0;
            for (VarName var : regs.get(reg).vars) {
                if ((curlive.contains(var) || var.uid == 0) && vars.containsKey(var) && !vars.get(var).inmem && vars.get(var).regs.size() == 1) {
                    ++alias;
                }
            }
            if (alias > 2) {
                SPIMRegister reg1 = new SPIMInfRegister();
                regs.put(reg1, new RegisterStatus());
                code.addText(new SPIMInst(SPIMOp.move, reg1, reg));
                RegisterStatus regSt = regs.get(reg);
                for (VarName var : regSt.vars) {
                    if (curlive.contains(var) || var.uid == 0) {
                        regs.get(reg1).addVar(var);
                        vars.get(var).addReg(reg1);
                    }
                }
            } else {
                RegisterStatus regSt = regs.get(reg);
                for (VarName var : regSt.vars) {
                    if ((curlive.contains(var) || var.uid == 0) && vars.containsKey(var) && !vars.get(var).inmem && vars.get(var).regs.size() == 1) {
                        if (envr.bond.containsKey(var) && !envr.bond.get(var).equals(reg)) {
                            SPIMRegister reg1 = envr.bond.get(var);
                            code.addText(new SPIMInst(SPIMOp.move, reg1, reg));
                            regs.get(reg1).addVar(var);
                            vars.get(var).addReg(reg1);
                        } else if (curPara.containsKey(var) && !curPara.get(var).equals(reg)) {
                            SPIMRegister reg1 = curPara.get(var);
                            code.addText(new SPIMInst(SPIMOp.move, reg1, reg));
                            regs.get(reg1).addVar(var);
                            vars.get(var).addReg(reg1);
                        } else {
                            code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, getAddr(var)));
                            vars.get(var).inmem = true;
                        }
                    }
                }
            }
        }
    }

    SPIMRegister writeResultReg(VarName var) {
        SPIMRegister reg = null;
        if (envr.bond.containsKey(var)) {
            reg = envr.bond.get(var);
        } else if (curPara.containsKey(var)) {
            reg = curPara.get(var);
        } else if (var.isRet) {
            reg = SPIMRegID.$v0.getReg();
        } else {
            reg = new SPIMInfRegister();
        }
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        if (!vars.containsKey(var)) {
            getAddr(var);
        }
        for (SPIMRegister reg1 : vars.get(var).regs) {
            regs.get(reg1).delVar(var);
        }
        vars.get(var).regs.clear();
        saveReg(reg);
        clearReg(reg);
        vars.get(var).addReg(reg);
        regs.get(reg).addVar(var);
        vars.get(var).inmem = false;
        return reg;
    }

    SPIMRegister loadToReg(Value val) {
        //In registers
        if (vars.containsKey(val) && vars.get(val).regs.size() > 0) {
            return vars.get(val).regs.iterator().next();
        }
        //Does not in registers;
        SPIMRegister reg = null;
        if (val instanceof IntConst) {
            if (((IntConst) val).val == 0) {
                return SPIMRegID.$0.getReg();
            }
            reg = new SPIMInfRegister();
            code.addText(new SPIMInst(SPIMOp.li, reg, SPIMImmediate.getImmi(((IntConst) val).val)));
        } else if (val instanceof CharConst) {
            reg = new SPIMInfRegister();
            code.addText(new SPIMInst(SPIMOp.li, reg, SPIMImmediate.getImmi(((CharConst) val).ch)));
        } else if (val instanceof StringConst) {
            reg = new SPIMInfRegister();
            code.addText(new SPIMInst(SPIMOp.la, reg, getStringConst(((StringConst) val).s)));
        } else if (envr.bond.containsKey(val)) {
            reg = envr.bond.get(val);
            code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName)val)));
            vars.get(val).addReg(reg);
            regs.get(reg).addVar((VarName)val);
        } else if (curPara.containsKey(val)) {
            reg = curPara.get(val);
            code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName)val)));
            vars.get(val).addReg(reg);
            regs.get(reg).addVar((VarName)val);
        } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
            reg = new SPIMInfRegister();
            regs.put(reg, new RegisterStatus());
            if (val instanceof DeRefVar) {
                val = (((DeRefVar) val).val);
            }
            code.addText(new SPIMInst(SPIMOp.la, reg, getAddr((VarName)val)));
            vars.get(val).addReg(reg);
            regs.get(reg).addVar((VarName) val);
        } else {
            if (val instanceof DeRefVar) {
                reg = new SPIMInfRegister();
                regs.put(reg, new RegisterStatus());
                code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName) val)));
                code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, new SPIMAddress(reg)));
            } else {
                reg = new SPIMInfRegister();
                regs.put(reg, new RegisterStatus());
                code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName) val)));
                vars.get(val).addReg(reg);
                regs.get(reg).addVar((VarName) val);
            }
        }
        return reg;
    }

    void writeRegTo(VarName var, SPIMRegister reg) {
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        if (!vars.containsKey(var)) {
            getAddr(var);
        }
        for (SPIMRegister reg1 : vars.get(var).regs) {
            regs.get(reg1).delVar(var);
        }
        vars.get(var).regs.clear();
        regs.get(reg).addVar(var);
        vars.get(var).addReg(reg);
        vars.get(var).inmem = false;
    }

    void writeToReg(SPIMRegister reg, Value val) {
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        if (regs.get(reg).vars.contains(val)) {
            return;
        }
        //如果有大量重名 直接全存内存也不一定好
        saveReg(reg);
        clearReg(reg);
        if (val instanceof IntConst) {
            code.addText(new SPIMInst(SPIMOp.li, reg, SPIMImmediate.getImmi(((IntConst) val).val)));
        } else if (val instanceof CharConst) {
            code.addText(new SPIMInst(SPIMOp.li, reg, SPIMImmediate.getImmi(((CharConst) val).ch)));
        } else if (val instanceof StringConst) {
            code.addText(new SPIMInst(SPIMOp.la, reg, getStringConst(((StringConst) val).s)));
        } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
            if (val instanceof DeRefVar) {
                VarName val1 = (VarName)(((DeRefVar) val).val);
                if (vars.containsKey(val1) && vars.get(val1).regs.size() > 0) {
                    for (SPIMRegister reg1 : vars.get(val1).regs) {
                        code.addText(new SPIMInst(SPIMOp.move, reg, reg1));
                        break;
                    }
                    for (SPIMRegister reg1 : vars.get(val1).regs) {
                        regs.get(reg1).addVar(val1);
                        for (VarName var : regs.get(reg1).vars) {
                            regs.get(reg).addVar(var);
                            vars.get(var).addReg(reg);
                        }
                    }
                    vars.get(val1).addReg(reg);
                    regs.get(reg).addVar(val1);
                } else {
                    code.addText(new SPIMInst(val1.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName)val)));
                    if (!vars.containsKey(val1)) {
                        getAddr(val1);
                    }
                    vars.get(val1).addReg(reg);
                    regs.get(reg).addVar(val1);
                }
            } else {
                code.addText(new SPIMInst(SPIMOp.la, reg, getAddr((VarName)val)));
                vars.get(val).addReg(reg);
                regs.get(reg).addVar((VarName) val);
            }
        } else {
            VarName val1 = (VarName)val;
            if (vars.containsKey(val1) && vars.get(val1).regs.size() > 0) {
                for (SPIMRegister reg1 : vars.get(val1).regs) {
                    code.addText(new SPIMInst(SPIMOp.move, reg, reg1));
                    break;
                }
                for (SPIMRegister reg1 : vars.get(val1).regs) {
                    regs.get(reg1).addVar(val1);
                    for (VarName var : regs.get(reg1).vars) {
                        if (var.equals(val1) || reg.equals(reg1)) {
                            continue;
                        }
                        regs.get(reg).addVar(var);
                        vars.get(var).addReg(reg);
                    }
                }
                vars.get(val1).addReg(reg);
                regs.get(reg).addVar(val1);
            } else {
                if (val instanceof DeRefVar) {
                    regs.put(reg, new RegisterStatus());
                    code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName) val)));
                    code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, new SPIMAddress(reg)));
                } else {
                    regs.put(reg, new RegisterStatus());
                    code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, getAddr((VarName) val)));
                    vars.get(val).addReg(reg);
                    regs.get(reg).addVar((VarName) val);
                }
            }
        }
    }

    void writeAddrTo(VarName var, SPIMAddress adr) {
        if (!vars.containsKey(var)) {
            getAddr(var);
        }
        for (SPIMRegister reg1 : regs.keySet()) {
            if (regs.get(reg1).vars.contains(var)) {
                regs.get(reg1).vars.remove(var);
            }
        }
        SPIMRegister reg = null;
        if (envr.bond.containsKey(var)) {
            reg = envr.bond.get(var);
        } else if (curPara.containsKey(var)) {
            reg = curPara.get(var);
        } else {
            if (var.isRet) {
                reg = SPIMRegID.$v0.getReg();
            } else {
                reg = new SPIMInfRegister();
            }
        }
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        code.addText(new SPIMInst(SPIMOp.la, reg, adr));
        regs.get(reg).addVar(var);
        vars.get(var).addReg(reg);
        vars.get(var).inmem = false;
    }

    void writeValTo(VarName var, Value val) {
        //需要分类讨论的要素：var是否绑定了某个寄存器 val是常量(immi/address(含数组结构))或是某个变量
        if (var instanceof DeRefVar) {
            throw new InternalError("Unexpected Pointer type.\n");
        }
        if (var.equals(val)) {
            return;
        }
        if (!vars.containsKey(var)) {
            getAddr(var);
        }
        for (SPIMRegister reg1 : regs.keySet()) {
            if (regs.get(reg1).vars.contains(var)) {
                regs.get(reg1).vars.remove(var);
            }
        }
        vars.get(var).regs.clear();
        vars.get(var).inmem = false;
        SPIMRegister reg = null;
        if (var.isRet) {
            reg = SPIMRegID.$v0.getReg();
        } else {
            //注意！如果val是个已经有reg的东西的话……
            if (val instanceof VarName) {
                VarName var1 = (VarName) val;
                if (vars.containsKey(var1) && vars.get(var1).regs.size() > 0) {
                    for (SPIMRegister reg1 : vars.get(var1).regs) {
                        vars.get(var).addReg(reg1);
                        regs.get(reg1).addVar(var);
                    }
                    return;
                }
            }
            if (envr.bond.containsKey(var)) {
                reg = envr.bond.get(var);
            } else if (curPara.containsKey(var)) {
                reg = curPara.get(var);
            } else {
                reg = new SPIMInfRegister();
            }
        }
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        writeToReg(reg, val);
        regs.get(reg).addVar(var);
        vars.get(var).addReg(reg);
        vars.get(var).inmem = false;
    }

    void genInst(MIRInst inst, HashSet<VarName> liveOut) {
        curlive = liveOut;
        if (inst.label != null) {
            code.addText(new SPIMInst(getLabel(inst.label.name)));
        }
        /*
        List<String> list = inst.print();
        String IR = "";
        for (String s : list) {
            IR += s;
        }
        System.out.println(("#" + IR));
        code.addText(new SPIMInst(getLabel("#" + IR)));
        for (VarName var : curlive) {
            System.out.println("now living : " + var.name);
        }
        */
        if (inst instanceof AssignInst) {
            genInst((AssignInst)inst);
        } else if (inst instanceof CallInst) {
            genInst((CallInst) inst);
        } else if (inst instanceof GotoInst) {
            genInst((GotoInst)inst);
        } else if (inst instanceof IfInst) {
            genInst((IfInst)inst);
        } else if (inst instanceof MemInst) {
            genInst((MemInst)inst);
        } else if (inst instanceof ParaInst) {
            genInst((ParaInst)inst);
        } else if (inst instanceof RecvInst) {
            genInst((RecvInst)inst);
        } else if (inst instanceof ReturnInst) {
            genInst((ReturnInst)inst);
        }
    }

    int alignTo(int val, int align) {
        if (val % align != 0) {
            return val + align - val % align;
        }
        return val;
    }

    void genInst(AssignInst inst) {
        if (inst.op.equals(ExprOp.asgr)) {
            //TODO eliminate struct move?
            SPIMAddress src = getAddr((VarName)inst.src1),
                        dst = getAddr(inst.dest);
            SPIMRegister reg = new SPIMInfRegister();
            if (inst.dest.align == 1) {
                for (int i = 0; i < inst.dest.size; ++i) {
                    code.addText(new SPIMInst(SPIMOp.lb, reg, src.addImmi(i)));
                    code.addText(new SPIMInst(SPIMOp.sb, reg, dst.addImmi(i)));
                }
            } else {
                for (int i = 0; i < inst.dest.size; i += 4) {
                    code.addText(new SPIMInst(SPIMOp.lw, reg, src.addImmi(i)));
                    code.addText(new SPIMInst(SPIMOp.sw, reg, dst.addImmi(i)));
                }
            }
        } else {
            if (inst.dest instanceof DeRefVar) {
                SPIMAddress adr = getAddr(inst.dest);
                if (inst.op.equals(ExprOp.asg)) {
                    code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, loadToReg(inst.src1), adr));
                } else if (inst.op.equals(ExprOp.adr)) {
                    if (inst.src1 instanceof DeRefVar) {
                        code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, loadToReg(((DeRefVar) inst.src1).val), adr));
                    } else if (inst.src1 instanceof VarName) {
                        SPIMInfRegister reg = new SPIMInfRegister();
                        code.addText(new SPIMInst(SPIMOp.la, reg, getAddr((VarName)inst.src1)));
                        code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, adr));
                    }
                } else {
                    int cnt = inst.op.cnt;
                    if (cnt == 1) {
                        LinkedList<SPIMRegister> list = new LinkedList<>();
                        list.push(loadToReg(inst.src1));
                        list.push(new SPIMInfRegister());
                        code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1)));
                        code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, list.get(0), adr));
                    } else if (cnt == 2) {
                        Value val = inst.src2;
                        if (val instanceof IntConst) {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(new SPIMInfRegister());
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), SPIMImmediate.getImmi(((IntConst) val).val)));
                            code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, list.get(0), adr));
                        } else if (val instanceof CharConst) {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(new SPIMInfRegister());
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), SPIMImmediate.getImmi(((CharConst) val).ch)));
                            code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, list.get(0), adr));
                        } else if (val instanceof StringConst) {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(new SPIMInfRegister());
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getStringConst(((StringConst) val).s)));
                            code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, list.get(0), adr));
                        } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
                            if (val instanceof DeRefVar) {
                                val = ((DeRefVar) val).val;
                            }
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(new SPIMInfRegister());
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getAddr((VarName) val)));
                            code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, list.get(0), adr));
                        } else {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src2));
                            list.push(loadToReg(inst.src1));
                            list.push(new SPIMInfRegister());
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), list.get(2)));
                            code.addText(new SPIMInst(inst.dest.size == 4 ? SPIMOp.sw : SPIMOp.sb, list.get(0), adr));
                        }
                    }
                }
            } else {
                if (inst.op.equals(ExprOp.asg)) {
                    writeValTo(inst.dest, inst.src1);
                } else if (inst.op.equals(ExprOp.adr)) {
                    if (inst.src1 instanceof DeRefVar) {
                        writeValTo(inst.dest, ((DeRefVar) inst.src1).val);
                    } else if (inst.src1 instanceof VarName) {
                        writeAddrTo(inst.dest, getAddr((VarName) inst.src1));
                    }
                } else {
                    int cnt = inst.op.cnt;
                    if (cnt == 1) {
                        //op with 1 src can't be optimized
                        LinkedList<SPIMRegister> list = new LinkedList<>();
                        list.push(loadToReg(inst.src1));
                        list.push(writeResultReg(inst.dest));
                        code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1)));
                    } else if (cnt == 2) {
                        Value val = inst.src2;
                        if (val instanceof IntConst) {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(writeResultReg(inst.dest));
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), SPIMImmediate.getImmi(((IntConst) val).val)));
                        } else if (val instanceof CharConst) {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(writeResultReg(inst.dest));
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), SPIMImmediate.getImmi(((CharConst) val).ch)));
                        } else if (val instanceof StringConst) {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(writeResultReg(inst.dest));
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getStringConst(((StringConst) val).s)));
                        } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
                            if (val instanceof DeRefVar) {
                                val = ((DeRefVar) val).val;
                            }
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src1));
                            list.push(writeResultReg(inst.dest));
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getAddr((VarName) val)));
                        } else {
                            LinkedList<SPIMRegister> list = new LinkedList<>();
                            list.push(loadToReg(inst.src2));
                            list.push(loadToReg(inst.src1));
                            list.push(writeResultReg(inst.dest));
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), list.get(2)));
                        }
                    }
                }
            }
        }
    }

    void saveRegs(HashSet<SPIMRegister> regs) {
        for (SPIMRegister reg : regs) {
            saveReg(reg);
            clearReg(reg);
        }
    }

    void genInst(CallInst inst) {
        if (inst.func.name.equals("___printf")) {
            if (((IntConst)inst.num).val == 1) {
                SPIMRegister reg = SPIMRegID.$a0.getReg(), reg1 = SPIMRegID.$v0.getReg();
                saveReg(reg);
                writeToReg(reg, pStack.pop());
                saveReg(reg1);
                clearReg(reg1);
                code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(4)));
                code.addText(new SPIMInst(SPIMOp.syscall));
                return;
            } else if (pStack.getFirst() instanceof StringConst) {
                String s = ((StringConst)pStack.getFirst()).s;
                if (s.equals("%d") || s.equals("%d\n")) {
                    pStack.pop();
                    SPIMRegister reg = SPIMRegID.$a0.getReg(), reg1 = SPIMRegID.$v0.getReg();
                    saveReg(SPIMRegID.$a0.getReg());
                    writeToReg(reg, pStack.pop());
                    saveReg(SPIMRegID.$v0.getReg());
                    clearReg(reg1);
                    code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(1)));
                    code.addText(new SPIMInst(SPIMOp.syscall));
                    if (s.equals("%d\n")) {
                        code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('\n')));
                        code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(11)));
                        code.addText(new SPIMInst(SPIMOp.syscall));
                    }
                    return;
                } else if (s.equals("%s") || s.equals("%s\n")) {
                    pStack.pop();
                    SPIMRegister reg = SPIMRegID.$a0.getReg(), reg1 = SPIMRegID.$v0.getReg();
                    saveReg(SPIMRegID.$a0.getReg());
                    writeToReg(reg, pStack.pop());
                    saveReg(SPIMRegID.$v0.getReg());
                    clearReg(reg1);
                    code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(4)));
                    code.addText(new SPIMInst(SPIMOp.syscall));
                    if (s.equals("%s\n")) {
                        code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('\n')));
                        code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(11)));
                        code.addText(new SPIMInst(SPIMOp.syscall));
                    }
                    return;
                }
            }
        }
        if (inst.func.name.equals("___getchar")) {
            SPIMRegister reg1 = SPIMRegID.$v0.getReg();
            saveReg(SPIMRegID.$v0.getReg());
            if (regs.containsKey(reg1)) {
                for (VarName var : regs.get(reg1).vars) {
                    vars.get(var).delReg(reg1);
                }
                regs.get(reg1).vars.clear();
            }
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(12)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            if (inst.dest != null) {
                if (inst.dest instanceof DeRefVar) {
                    code.addText(new SPIMInst(((DeRefVar) inst.dest).size == 4 ? SPIMOp.sw : SPIMOp.sb, SPIMRegID.$v0.getReg(), getAddr(inst.dest)));
                } else {
                    writeRegTo(inst.dest, SPIMRegID.$v0.getReg());
                }
            }
            return;
        } else if (inst.func.name.equals("___malloc")) {
            SPIMRegister reg = SPIMRegID.$a0.getReg(), reg1 = SPIMRegID.$v0.getReg();
            saveReg(SPIMRegID.$a0.getReg());
            writeToReg(reg, pStack.pop());
            saveReg(SPIMRegID.$v0.getReg());
            clearReg(reg1);
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(9)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            if (inst.dest != null) {
                if (inst.dest instanceof DeRefVar) {
                    code.addText(new SPIMInst(((DeRefVar) inst.dest).size == 4 ? SPIMOp.sw : SPIMOp.sb, SPIMRegID.$v0.getReg(), getAddr(inst.dest)));
                } else {
                    writeRegTo(inst.dest, SPIMRegID.$v0.getReg());
                }
            }
            return;
        }
        int raAdr = alignTo(curDelta, 4);
        int paraAdr = raAdr + 4, paraCnt = 0;
        for (Value val : pStack) {
            paraAdr = alignTo(paraAdr, val.align) + val.size;
            if (val instanceof VarName && ((VarName) val).isStruct) {
                SPIMAddress src = getAddr((VarName)val),
                            dst = new SPIMAddress(SPIMImmediate.getImmi(-paraAdr), SPIMRegID.$sp.getReg());
                SPIMRegister reg = new SPIMInfRegister();
                if (val.align == 1) {
                    for (int i = 0; i < val.size; ++i) {
                        code.addText(new SPIMInst(SPIMOp.lb, reg, src.addImmi(i)));
                        code.addText(new SPIMInst(SPIMOp.sb, reg, dst.addImmi(i)));
                    }
                } else {
                    for (int i = 0; i < val.size; i += 4) {
                        code.addText(new SPIMInst(SPIMOp.lw, reg, src.addImmi(i)));
                        code.addText(new SPIMInst(SPIMOp.sw, reg, dst.addImmi(i)));
                    }
                }
            } else {
                if (paraCnt < 4 && !(inst.func.name.equals("___printf"))) {
                    SPIMPhysicalRegister reg = null;
                    switch(paraCnt) {
                        case 0 : {
                            reg = SPIMRegID.$a0.getReg();
                            break;
                        }
                        case 1 : {
                            reg = SPIMRegID.$a1.getReg();
                            break;
                        }
                        case 2 : {
                            reg = SPIMRegID.$a2.getReg();
                            break;
                        }
                        case 3 : {
                            reg = SPIMRegID.$a3.getReg();
                            break;
                        }
                    }
                    saveRegMem(reg);
                    writeToReg(reg, val);
                } else {
                    SPIMRegister reg = loadToReg(val);
                    code.addText(new SPIMInst(val.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, new SPIMAddress(SPIMImmediate.getImmi(-paraAdr), SPIMRegID.$sp.getReg())));
                }
            }
            ++paraCnt;
        }
        if (inst.func instanceof VarName && ((VarName) inst.func).isSTL) {
            //TODO STL opti
            //TODO inline STL or special printf
            if (inst.func.name.equals("___printf")) {
                HashSet<SPIMRegister> regs = new HashSet<>();
                regs.add(SPIMRegID.$a0.getReg());
                regs.add(SPIMRegID.$v0.getReg());
                regs.add(SPIMRegID.$t0.getReg());
                regs.add(SPIMRegID.$t1.getReg());
                if (pStack.getFirst() instanceof StringConst) {
                    String s = ((StringConst)pStack.getFirst()).s;
                    for (int i = 0; i + 3 < s.length(); ++i) {
                        if (s.charAt(i) == '%' && (s.charAt(i + 1) == '.' || s.charAt(i + 1) == '0')) {
                            regs.add(SPIMRegID.$a1.getReg());
                            regs.add(SPIMRegID.$a2.getReg());
                        }
                    }
                } else {
                    regs.add(SPIMRegID.$a1.getReg());
                    regs.add(SPIMRegID.$a2.getReg());
                }
                saveRegs(regs);
                code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$sp.getReg(), SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
                code.addText(new SPIMInst(SPIMOp.jal, new SPIMAddress(getLabel("___printf"))));
                code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$sp.getReg(), SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
            }
        } else {
            synchronGlobalBonds();
            saveCall();
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$sp.getReg(),  SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
            if (inst.func instanceof VarName && !(inst.func instanceof DeRefVar)) {
                code.addText(new SPIMInst(SPIMOp.jal, new SPIMAddress(getLabel(inst.func.name))));
            } else {
                code.addText(new SPIMInst(SPIMOp.jal, loadToReg(inst.func)));
            }
            code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$sp.getReg(),  SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
            if (inst.dest != null) {
                if (inst.dest instanceof DeRefVar) {
                    code.addText(new SPIMInst(((DeRefVar) inst.dest).size == 4 ? SPIMOp.sw : SPIMOp.sb, SPIMRegID.$v0.getReg(), getAddr(inst.dest)));
                } else {
                    writeRegTo(inst.dest, SPIMRegID.$v0.getReg());
                }
            }
        }
        pStack.clear();
    }

    void genInst(GotoInst inst) {
        code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(getLabel(inst.target.name))));
    }

    void genInst(IfInst inst) {
        LinkedList<SPIMRegister> list = new LinkedList<>();
        Value val = inst.src2;
        if (val instanceof IntConst) {
            list.push(loadToReg(inst.src1));
            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), SPIMImmediate.getImmi(((IntConst) val).val), new SPIMAddress(getLabel(inst.target.name))));
        } else if (val instanceof CharConst) {
            list.push(loadToReg(inst.src1));
            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), SPIMImmediate.getImmi(((CharConst) val).ch), new SPIMAddress(getLabel(inst.target.name))));
        } else if (val instanceof StringConst) {
            list.push(loadToReg(inst.src1));
            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), getStringConst(((StringConst) val).s), new SPIMAddress(getLabel(inst.target.name))));
        } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
            if (val instanceof DeRefVar) {
                val = ((DeRefVar) val).val;
            }
            list.push(loadToReg(inst.src1));
            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), getAddr((VarName) val), new SPIMAddress(getLabel(inst.target.name))));
        } else {
            list.push(loadToReg(inst.src2));
            list.push(loadToReg(inst.src1));
            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), new SPIMAddress(getLabel(inst.target.name))));
        }
    }

    void genInst(MemInst inst) {
        curDelta = alignTo(curDelta, inst.var.align) + inst.var.size;
        vars.put(inst.var, new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg())));
        vars.get(inst.var).inmem = true;
        if (envr.bond.containsKey(inst.var)) {
            SPIMRegister reg = envr.bond.get(inst.var);
            if (!regs.containsKey(reg)) {
                regs.put(reg, new RegisterStatus());
            }
        }
    }

    void genInst(ParaInst inst) {
        pStack.add(inst.val);
    }

    void genInst(RecvInst inst) {
        curDelta = alignTo(curDelta, inst.var.align) + inst.var.size;
        vars.put(inst.var, new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg())));
        if (inst.var.isPara != -1 && !inst.var.isStruct) {
            vars.get(inst.var).inmem = false;
            SPIMPhysicalRegister reg = null;
            switch(inst.var.isPara) {
                case 0 : {
                    reg = SPIMRegID.$a0.getReg();
                    break;
                }
                case 1 : {
                    reg = SPIMRegID.$a1.getReg();
                    break;
                }
                case 2 : {
                    reg = SPIMRegID.$a2.getReg();
                    break;
                }
                case 3 : {
                    reg = SPIMRegID.$a3.getReg();
                    break;
                }
            }
            if (!regs.containsKey(reg)) {
                regs.put(reg, new RegisterStatus());
            }
            regs.get(reg).addVar(inst.var);
            curPara.put(inst.var, reg);
            vars.get(inst.var).addReg(reg);
        } else {
            vars.get(inst.var).inmem = true;
            if (envr.bond.containsKey(inst.var)) {
                SPIMRegister reg = envr.bond.get(inst.var);
                if (!regs.containsKey(reg)) {
                    regs.put(reg, new RegisterStatus());
                }
            }
        }
    }

    void genInst(ReturnInst inst) {
        if (curlive.size() != 0) {
            throw new InternalError("Variable live after return.\n");
        }
        synchronGlobalBonds();
        saveGlobalUnbonded();
        saveReturnValue();
        //TODO optimization
        if (hasCall) {
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$ra.getReg(), new SPIMAddress(SPIMImmediate.getImmi(-4), SPIMRegID.$sp.getReg())));
        }
        code.addText(new SPIMInst(SPIMOp.jr, SPIMRegID.$ra.getReg()));
    }

    public SPIMCode gen(Program prog, AdvEnvr envr) {
        code = new SPIMCode();
        strCnt = 0;
        labels = new HashMap<>();
        strs = new HashMap<>();
        this.envr = envr;
        regs = new HashMap<>();
        vars = new HashMap<>();
        addGlobal(prog.list.get(0));
        for (ProgUnit unit : prog.list) {
            if (unit.label.name.equals("__global")) {
                continue;
            }
            addFunc(unit);
        }
        return code;
    }
}

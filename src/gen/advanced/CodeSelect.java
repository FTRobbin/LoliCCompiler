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

    void addGlobal(ProgUnit global) {
        curDelta = 0;
        for (MIRInst inst : global.list) {
            if (inst instanceof ReturnInst) {
                code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(new SPIMLabel("__main"))));
            } else if (inst instanceof MemInst) {
                MemInst mem = (MemInst)inst;
                code.addData("\t\t.align\t" + mem.var.align);
                code.addData("\t\t.extern\t" + mem.var.name + "\t" + mem.size);
                code.addData(mem.var.name + ":\t\t" + ".space" + "\t" + mem.size);
                vars.put(mem.var, (new AddressDescription(new SPIMAddress(new SPIMLabel(mem.var.name)))));
                vars.get(mem.var).inmem = true;
                setGlobalBond(mem.var);
            } else {
                genInst(inst, null);
            }
        }
    }

    int curDelta;
    LinkedList<Value> pStack;
    HashMap<VarName, SPIMRegister> curPara;

    void addFunc(ProgUnit func) {
        curDelta = 0;
        pStack = new LinkedList<>();
        curPara = new HashMap<>();
        SPIMLabel entry = getLabel(func.label.name);
        code.addText(new SPIMInst(entry));
        for (Block b : func.graph.ver) {
            genBlock(b);
        }
        freeRegAll();
    }

    LinkedList<HashSet<VarName>> liveList;

    void cutDef(MIRInst inst, HashSet<VarName> cur) {
        if (inst instanceof AssignInst) {
            cur.remove(((AssignInst) inst).dest);
        } else if (inst instanceof CallInst)  {
            if (((CallInst) inst).dest != null) {
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

    void genBlock(Block b) {
        liveList = new LinkedList<>();
        //TODO : many TLE
        calLive(b);
        setBondReg(b.liveIn);
        for (MIRInst inst : b.insts) {
            genInst(inst, liveList.pop());
        }
        saveNonArguBondRegs(b.liveOut);
    }

    HashSet<VarName> curlive;

    void freeRegAll() {
        for (SPIMRegister reg : regs.keySet()) {
            RegisterStatus regSt = regs.get(reg);
            for (VarName var : regSt.vars) {
                if (vars.containsKey(var)) {
                    vars.get(var).regs.clear();
                }
            }
        }
    }

    void setBondReg(HashSet<VarName> live) {
        for (VarName var : live) {
            if (envr.bond.containsKey(var)) {
                SPIMRegister reg = envr.bond.get(var);
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
    }

    void setGlobalBond(VarName var) {
        if (envr.bond.containsKey(var)) {
            SPIMRegister reg = envr.bond.get(var);
            if (!regs.containsKey(reg)) {
                regs.put(reg, new RegisterStatus());
            }
            regs.get(reg).addVar(var);
            vars.get(var).addReg(reg);
        }
    }

    void saveRegs(HashSet<SPIMRegister> regs) {
        for (SPIMRegister reg : regs) {
            saveReg(reg);
        }
    }

    void saveReg(SPIMRegister reg) {
        if (regs.containsKey(reg)) {
            RegisterStatus regSt = regs.get(reg);
            for (VarName var : regSt.vars) {
                if (curlive.contains(var) || var.uid == 0) {
                    if (!vars.containsKey(var)) {
                        throw new InternalError("Undefined variable being saved.");
                    }
                    if (!vars.get(var).inmem) {
                        code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, vars.get(var).mem));
                        vars.get(var).inmem = true;
                    }
                    vars.get(var).delReg(reg);
                }
            }
            regs.get(reg).vars.clear();
        }
    }

    void saveNonArguBondRegs(HashSet<VarName> live) {
        for (VarName var : live) {
            if (var.isPara != -1 || envr.bond.containsKey(var) || vars.get(var).inmem) {
                continue;
            } else {
                HashSet<SPIMRegister> regSet = vars.get(var).regs;
                Iterator<SPIMRegister> iter = regSet.iterator();
                while (iter.hasNext()) {
                    SPIMRegister reg = iter.next();
                    if (!vars.get(var).inmem) {
                        code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, vars.get(var).mem));
                        vars.get(var).inmem = true;
                    }
                    regs.get(reg).delVar(var);
                    vars.get(var).delReg(reg);
                }
            }
        }
    }

    void saveCall() {
        for (SPIMRegister reg : regs.keySet()) {
            RegisterStatus regSt = regs.get(reg);
            LinkedList<VarName> removed = new LinkedList<>();
            for (VarName var : regSt.vars) {
                if (var.uid == 0 || curlive.contains(var)) {
                    removed.add(var);
                    if (!vars.get(var).inmem) {
                        code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, vars.get(var).mem));
                        vars.get(var).inmem = true;
                    }
                    vars.get(var).delReg(reg);
                }
            }
            for (VarName var : removed) {
                regSt.delVar(var);
            }
        }
    }

    void loadArgu() {
        for (VarName var : curPara.keySet()) {
            SPIMRegister reg = curPara.get(var);
            code.addText(new SPIMInst(var.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, vars.get(var).mem));
            regs.get(reg).addVar(var);
            vars.get(var).addReg(reg);
        }
    }

    void loadArguSTL(int argCnt) {
        for (VarName var : curPara.keySet()) {
            SPIMRegister reg = curPara.get(var);
            if (reg.print().charAt(2) - '0' < argCnt) {
                code.addText(new SPIMInst(var.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, vars.get(var).mem));
                regs.get(reg).addVar(var);
                vars.get(var).addReg(reg);
            }
        }
    }

    SPIMAddress getAddr(VarName var) {
        if (!vars.containsKey(var)) {
            curDelta = alignTo(curDelta, var.align) + curDelta;
            curDelta += var.size;
            vars.put(var, (new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg()))));
            vars.get(var).inmem = true;
        }
        return vars.get(var).mem;
    }

    void writeValTo(VarName var, Value val) {
        //需要分类讨论的要素：var是否绑定了某个寄存器 val是常量(immi/address(含数组结构))或是某个变量
        if (var.equals(val)) {
            return;
        }
        if (!vars.containsKey(var)) {
            curDelta = alignTo(curDelta, var.align) + curDelta;
            curDelta += var.size;
            vars.put(var, (new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg()))));
            vars.get(var).inmem = true;
        }
        for (SPIMRegister reg1 : regs.keySet()) {
            if (regs.get(reg1).vars.contains(var)) {
                regs.get(reg1).vars.remove(var);
            }
        }
        SPIMRegister reg = null;
        if (envr.bond.containsKey(var)) {
            reg = envr.bond.get(var);
        } else {
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
                reg = new SPIMInfRegister();
            }
        }
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        writeToReg(reg, val);
        regs.get(reg).addVar(var);
    }

    void writeRegTo(VarName var, SPIMRegister reg) {
        //TODO
    }

    void writeToReg(SPIMRegister reg, Value val) {
        if (!regs.containsKey(reg)) {
            regs.put(reg, new RegisterStatus());
        }
        //如果有大量重名 直接全存内存也不一定好
        int alias = 0;
        for (VarName var : regs.get(reg).vars) {
            if (curlive.contains(var) && vars.containsKey(var) && !vars.get(var).inmem) {
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
                    vars.get(var).delReg(reg);
                    regs.get(reg1).addVar(var);
                    vars.get(var).addReg(reg1);
                }
            }
            regs.get(reg).vars.clear();
        } else {
            RegisterStatus regSt = regs.get(reg);
            for (VarName var : regSt.vars) {
                if (curlive.contains(var) || var.uid == 0) {
                    if (!vars.get(var).inmem) {
                        code.addText(new SPIMInst(var.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, vars.get(var).mem));
                        vars.get(var).inmem = true;
                    }
                    vars.get(var).delReg(reg);
                }
            }
            regs.get(reg).vars.clear();
        }
        if (val instanceof IntConst) {
            code.addText(new SPIMInst(SPIMOp.li, reg, SPIMImmediate.getImmi(((IntConst) val).val)));
        } else if (val instanceof CharConst) {
            code.addText(new SPIMInst(SPIMOp.li, reg, SPIMImmediate.getImmi(((CharConst) val).ch)));
        } else if (val instanceof StringConst) {
            code.addText(new SPIMInst(SPIMOp.la, reg, getStringConst(((StringConst) val).s)));
        } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
            if (val instanceof DeRefVar) {
                Value val1 = ((DeRefVar) val).val;
                if (val1 instanceof VarName && (((VarName) val1).isStruct || ((VarName) val1).isArray || ((VarName) val1).isFunc)) {
                    code.addText(new SPIMInst(SPIMOp.la, reg, getAddr((VarName) val1)));
                } else {
                    VarName var2 = (VarName) val1;
                    if (vars.containsKey(var2) && vars.get(var2).regs.size() > 0) {
                        for (SPIMRegister reg1 : vars.get(var2).regs) {
                            code.addText(new SPIMInst(val.size == 4 ? SPIMOp.lw : SPIMOp.lb, reg, new SPIMAddress(reg1)));
                            break;
                        }
                    } else {

                    }
                }
            } else {
                //LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                //code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getAddr((VarName) val)));
            }
        } else {
            //LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1, inst.src2);
            //code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), list.get(2)));
        }
    }

    void writeAddrTo(VarName var, SPIMAddress adr) {
        //TODO
    }

    LinkedList<SPIMRegister> writeReadReg(VarName dest, Value val1, Value val2) {
        //TODO
        return null;
    }

    LinkedList<SPIMRegister> writeReadReg(VarName dest, Value val1) {
        //TODO
        return null;
    }

    LinkedList<SPIMRegister> readReg(Value val1, Value val2) {
        //TODO
        return null;
    }

    SPIMRegister readReg(Value val) {
        //TODO
        return null;
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
        code.addText(new SPIMInst(getLabel("#" + IR)));
        */
        if (inst instanceof AssignInst) {
            genInst((AssignInst)inst);
        } else if (inst instanceof CallInst) {
            genInst((CallInst)inst);
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
        } else if (inst.op.equals(ExprOp.asg)) {
            writeValTo(inst.dest, inst.src1);
        } else if (inst.op.equals(ExprOp.adr)) {
            if (inst.src1 instanceof DeRefVar) {
                writeValTo(inst.dest, ((DeRefVar) inst.src1).val);
            } else if (inst.src1 instanceof VarName){
                writeAddrTo(inst.dest, getAddr((VarName)inst.src1));
            }
        } else {
            int cnt = inst.op.cnt;
            if (cnt == 1) {
                //op with 1 src can't be optimized
                LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1)));
            } else if (cnt == 2) {
                Value val = inst.src2;
                if (val instanceof IntConst) {
                    LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                    code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), SPIMImmediate.getImmi(((IntConst)val).val)));
                } else if (val instanceof CharConst) {
                    LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                    code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), SPIMImmediate.getImmi(((CharConst)val).ch)));
                } else if (val instanceof StringConst) {
                    LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                    code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getStringConst(((StringConst) val).s)));
                } else if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
                    if (val instanceof DeRefVar) {
                        val = ((DeRefVar) val).val;
                        if (val instanceof VarName && (((VarName) val).isStruct || ((VarName) val).isArray || ((VarName) val).isFunc)) {
                            LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getAddr((VarName) val)));
                        } else {
                            LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1, val);
                            code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), list.get(2)));
                        }
                    } else {
                        LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1);
                        code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), getAddr((VarName) val)));
                    }
                } else {
                    LinkedList<SPIMRegister> list = writeReadReg(inst.dest, inst.src1, inst.src2);
                    code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1), list.get(2)));
                }
            }
        }
    }

    void genInst(CallInst inst) {
        int raAdr = alignTo(curDelta, 4) + 4;
        code.addText(new SPIMInst(SPIMOp.sw, SPIMRegID.$ra.getReg(), new SPIMAddress(SPIMImmediate.getImmi(-raAdr), SPIMRegID.$sp.getReg())));
        int paraAdr = raAdr, paraCnt = 0;
        for (Value val : pStack) {
            paraAdr = alignTo(paraAdr, val.align) + val.size;
            if (val instanceof VarName && ((VarName) val).isStruct) {
                SPIMAddress src = getAddr((VarName)val),
                            dst = new SPIMAddress(SPIMImmediate.getImmi(paraAdr), SPIMRegID.$sp.getReg());
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
                    saveReg(reg);
                    writeToReg(reg, val);
                } else {
                    SPIMRegister reg = readReg(val);
                    code.addText(new SPIMInst(val.size == 4 ? SPIMOp.sw : SPIMOp.sb, reg, new SPIMAddress(SPIMImmediate.getImmi(paraAdr), SPIMRegID.$sp.getReg())));
                }
            }
            ++paraCnt;
        }
        pStack.clear();
        if (inst.func instanceof VarName && ((VarName) inst.func).isSTL) {
            //TODO STL opti
            //TODO inline STL or special printf
            if (inst.func.name.equals("___printf")) {
                HashSet<SPIMRegister> regs = new HashSet<>();
                int argCnt = 0;
                regs.add(SPIMRegID.$a0.getReg());
                regs.add(SPIMRegID.$v0.getReg());
                regs.add(SPIMRegID.$t0.getReg());
                regs.add(SPIMRegID.$t1.getReg());
                argCnt = 1;
                if (pStack.getFirst() instanceof StringConst) {
                    String s = ((StringConst)pStack.getFirst()).s;
                    for (int i = 0; i + 3 < s.length(); ++i) {
                        if (s.charAt(i) == '%' && (s.charAt(i + 1) == '.' || s.charAt(i + 1) == '0')) {
                            regs.add(SPIMRegID.$a1.getReg());
                            regs.add(SPIMRegID.$a2.getReg());
                            argCnt = 3;
                        }
                    }
                } else {
                    regs.add(SPIMRegID.$a1.getReg());
                    regs.add(SPIMRegID.$a2.getReg());
                }
                saveRegs(regs);
                code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
                if (inst.func instanceof VarName && !(inst.func instanceof DeRefVar)) {
                    code.addText(new SPIMInst(SPIMOp.jal, new SPIMAddress(getLabel(inst.func.name))));
                } else {
                    code.addText(new SPIMInst(SPIMOp.jal, readReg(inst.func)));
                }
                code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
                code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$ra.getReg(), new SPIMAddress(SPIMImmediate.getImmi(-raAdr), SPIMRegID.$sp.getReg())));
                loadArguSTL(argCnt);
            } else if (inst.func.name.equals("___getchar") || inst.func.name.equals("___malloc")) {
                saveReg(SPIMRegID.$v0.getReg());
                code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
                if (inst.func instanceof VarName && !(inst.func instanceof DeRefVar)) {
                    code.addText(new SPIMInst(SPIMOp.jal, new SPIMAddress(getLabel(inst.func.name))));
                } else {
                    code.addText(new SPIMInst(SPIMOp.jal, readReg(inst.func)));
                }
                code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
                code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$ra.getReg(), new SPIMAddress(SPIMImmediate.getImmi(-raAdr), SPIMRegID.$sp.getReg())));
                if (inst.func.name.equals("___malloc")) {
                    loadArguSTL(1);
                }
                if (inst.dest != null) {
                    writeRegTo(inst.dest, SPIMRegID.$v0.getReg());
                }
            }
        } else {
            saveCall();
            freeRegAll();
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
            if (inst.func instanceof VarName && !(inst.func instanceof DeRefVar)) {
                code.addText(new SPIMInst(SPIMOp.jal, new SPIMAddress(getLabel(inst.func.name))));
            } else {
                code.addText(new SPIMInst(SPIMOp.jal, readReg(inst.func)));
            }
            code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$sp.getReg(), SPIMImmediate.getImmi(raAdr)));
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$ra.getReg(), new SPIMAddress(SPIMImmediate.getImmi(-raAdr), SPIMRegID.$sp.getReg())));
            loadArgu();
            if (inst.dest != null) {
                writeRegTo(inst.dest, SPIMRegID.$v0.getReg());
            }
        }
    }

    void genInst(GotoInst inst) {
        code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(getLabel(inst.target.name))));
    }

    void genInst(IfInst inst) {
        LinkedList<SPIMRegister> list = readReg(inst.src1, inst.src2);
        code.addText(new SPIMInst(SPIMOp.valueOf(inst.op.name()), list.get(0), list.get(1)));
    }

    void genInst(MemInst inst) {
        curDelta = alignTo(curDelta, inst.var.align) + inst.var.size;
        vars.put(inst.var, new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg())));
        vars.get(inst.var).inmem = true;
    }

    void genInst(ParaInst inst) {
        pStack.add(inst.val);
    }

    void genInst(RecvInst inst) {
        curDelta = alignTo(curDelta, inst.var.align) + inst.var.size;
        curDelta += inst.var.size;
        vars.put(inst.var, new AddressDescription(new SPIMAddress(SPIMImmediate.getImmi(-curDelta), SPIMRegID.$sp.getReg())));
        if (inst.var.isPara != -1 && !inst.var.isStruct) {
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
        }
    }

    void genInst(ReturnInst inst) {
        if (curlive.size() != 0) {
            throw new InternalError("Variable live after return.\n");
        }
        saveCall();
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

package gen.basic;

import gen.ASMCode;
import gen.CodeGen;
import gen.SPIMCode;
import mir.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/19.
 */
public class BasicGen implements CodeGen {

    public SPIMCode code;

    void addSTL() {
        code.addText(   "___printf:\n" +
                        "        lw  $t0 -4($fp)\n" +
                        "        move    $t1 $fp\n" +
                        "        sub $t1 4\n" +
                        "___printf_loop:\n" +
                        "        lb  $a0 0($t0)\n" +
                        "        beq $a0 0   ___printf_end\n" +
                        "        add $t0 1\n" +
                        "        beq $a0 '%' ___printf_fmt\n" +
                        "        li  $v0 11\n" +
                        "        syscall\n" +
                        "        j   ___printf_loop\n" +
                        "___printf_end:\n" +
                        "        jr  $ra\n" +
                        "___printf_fmt:\n" +
                        "        lb  $a0 0($t0)\n" +
                        "        add $t0 1\n" +
                        "        beq $a0 'd' ___printf_int\n" +
                        "        beq $a0 's' ___printf_str\n" +
                        "        beq $a0 'c' ___printf_char\n" +
                        "        beq $a0 '.' ___printf_width\n"  +
                        "        beq $a0 '0' ___printf_width\n" +
                        "___printf_int:\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a0 0($t1)\n" +
                        "        li  $v0 1\n" +
                        "        syscall\n" +
                        "        j   ___printf_loop \n" +
                        "___printf_str:\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a0 0($t1)\n" +
                        "        li  $v0 4\n" +
                        "        syscall\n" +
                        "        j   ___printf_loop \n" +
                        "___printf_char:\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a0 0($t1)\n" +
                        "        li  $v0 11\n" +
                        "        syscall\n" +
                        "        j   ___printf_loop \n" +
                        "___printf_width:\n" +
                        "        lb  $a2 0($t0)\n" +
                        "        add $t0 1\n" +
                        "        sub $a2  $a2  '1'\n" +
                        "        add $t0 1\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a1 0($t1)\n" +
                        "        blt $a1 10  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 100  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 1000  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 10000  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 100000  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 1000000  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 10000000  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "        blt $a1 100000000  ___printf_width_go\n" +
                        "        sub $a2  $a2  1\n" +
                        "___printf_width_go:\n" +
                        "        li  $a0 '0'\n" +
                        "        beq $a2 0   ___printf_width_int\n" +
                        "        sub $a2 $a2 1\n" +
                        "        li  $v0 11\n" +
                        "        syscall\n" +
                        "        j   ___printf_width_go\n" +
                        "___printf_width_int:\n" +
                        "        move    $a0 $a1\n" +
                        "        li  $v0 1\n" +
                        "        syscall\n" +
                        "        j  ___printf_loop\n" +
                        "___getchar:\n" +
                        "        li  $v0 12\n" +
                        "        syscall\n" +
                        "        jr  $ra\n" +
                        "___scanf:\n" +
                        "        lw  $t0 -4($fp)\n" +
                        "        move    $t1 $fp\n" +
                        "        sub $t1 4\n" +
                        "___scanf_loop:\n" +
                        "        lb  $a0 0($t0)\n" +
                        "        beq $a0 0   ___scanf_end\n" +
                        "        add $t0 1\n" +
                        "        beq $a0 '%' ___scanf_fmt\n" +
                        "        j   ___scanf_loop\n" +
                        "___scanf_end:\n" +
                        "        jr  $ra\n" +
                        "___scanf_fmt:\n" +
                        "        lb  $a0 0($t0)\n" +
                        "        add $t0 1\n" +
                        "        beq $a0 'd' ___scanf_int\n" +
                        "        beq $a0 's' ___scanf_str\n" +
                        "        beq $a0 'c' ___scanf_char\n" +
                        "___scanf_int:\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a0 0($t1)\n" +
                        "        li  $v0 5\n" +
                        "        syscall\n" +
                        "        sw  $v0 0($a0)\n" +
                        "        j   ___scanf_loop \n" +
                        "___scanf_str:\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a0 0($t1)\n" +
                        "        li  $a1 32767\n" +
                        "        li  $v0 8\n" +
                        "        syscall\n" +
                        "        j   ___scanf_loop \n" +
                        "___scanf_char:\n" +
                        "        sub $t1 4\n" +
                        "        lw  $a0 0($t1)\n" +
                        "        li  $v0 12\n" +
                        "        syscall\n" +
                        "        sb  $v0 0($a0)\n" +
                        "        j   ___scanf_loop \n" +
                        "___malloc:\n" +
                        "        lw  $a0 -4($fp)\n" +
                        "        li  $v0 9\n" +
                        "        syscall\n" +
                        "        jr  $ra");
    }

    void addGlobal(ProgUnit global) {
        code.addText("main:");
        for (MIRInst inst : global.list) {
            if (inst instanceof ReturnInst) {
                code.addText("\t\tmove\t$fp\t$sp");
                code.addText("\t\tj\t__main");
            } else if (inst instanceof MemInst) {
                MemInst mem = (MemInst)inst;
                code.addData("\t\t.extern\t" + mem.var.name + "\t" + mem.size);
                code.addData(mem.var.name + ":\t\t" + ".space" + "\t" + mem.size);
            } else {
                genInst(inst);
            }
        }
    }

    public HashMap<VarName, Integer> delta;
    public int curDelta;

    void addFunc(ProgUnit func) {
        delta = new HashMap<>();
        curDelta = 0;
        pStack = new LinkedList<>();
        code.addText(func.label.name + ":");
        for (MIRInst inst : func.list) {
            genInst(inst);
        }
        code.addText("\t\tjr\t$ra");
    }

    void genInst(MIRInst inst) {
        if (inst.label != null) {
            code.addText(inst.label.name + ":");
        }
        /*
        List<String> list = inst.print();
        String IR = "";
        for (String s : list) {
            IR += s;
        }
        code.addText("#" + IR);
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

    public int usedReg;

    public void releaseReg() {
        usedReg = 0;
    }

    public BasicReg getReg() {
        return BasicReg.values()[usedReg++];
    }

    public int strCnt;

    public String storeString(String s) {
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
        String label = "_str" + (strCnt++);
        code.addData(label + ":\t\t.asciiz\t" + trans);
        return label;
    }

    public void alignTo(int align) {
        if (curDelta % align != 0) {
            curDelta += align - curDelta % align;
        }
    }

    public String getAddr(VarName val) {
        if (val.uid == 0 && !val.isTemp) {
            return val.name;
        }
        if (val.isRet) {
            return "$v0";
        }
        if (!delta.containsKey(val)) {
            //Temporary
            if (!val.isTemp) {
                throw new InternalError("Undefined intermediate variable.");
            }
            alignTo(val.align);
            curDelta += val.size;
            delta.put(val, -curDelta);
        }
        return delta.get(val) + "($fp)";
    }

    public BasicReg loadToReg(Value val) {
        BasicReg reg = getReg();
        if (val instanceof DeRefVar) {
            if (((DeRefVar) val).isFunc || ((DeRefVar) val).isArray || ((DeRefVar) val).isStruct) {
                return loadToReg(((DeRefVar) val).val);
            } else {
                BasicReg reg1 = loadToReg(((DeRefVar) val).val);
                code.addText("\t\t" + (val.size == 4 ? "lw\t" : "lb\t") + reg.toString() + "\t0(" + reg1.toString() + ")");
            }
        } else if (val instanceof VarName) {
            if (((VarName) val).isFunc || ((VarName) val).isArray || ((VarName) val).isStruct) {
                code.addText("\t\t" + "la\t" + reg.toString() + "\t" + getAddr((VarName) val));
            } else {
                code.addText("\t\t" + (val.size == 4 ? "lw\t" : "lb\t") + reg.toString() + "\t" + getAddr((VarName) val));
            }
        } else if (val instanceof IntConst) {
            code.addText("\t\t" + "li\t" + reg.toString() + "\t" + ((IntConst) val).val);
        } else if (val instanceof CharConst) {
            code.addText("\t\t" + "li\t" + reg.toString() + "\t" + (int)((CharConst) val).ch);
        } else if (val instanceof StringConst) {
            code.addText("\t\t" + "la\t" + reg.toString() + "\t" + storeString(((StringConst) val).s));
        }
        return reg;
    }

    public void writeToMem(BasicReg reg, VarName var) {
        if (var.isRet) {
            code.addText("\t\t" + "move\t" + getAddr(var) + "\t" + reg.toString());
        } else if (var.isStruct) {
            BasicReg addr = (var instanceof DeRefVar) ? loadToReg(((DeRefVar)var).val) : loadToReg(var), tmpr = getReg();
            if (var.align == 1) {
                for (int i = 0; i < var.size; ++i) {
                    code.addText("\t\t" + "lb\t" + tmpr.toString() + "\t" + i + "(" + reg.toString() + ")");
                    code.addText("\t\t" + "sb\t" + tmpr.toString() + "\t" + i + "(" + addr.toString() + ")");
                }
            } else {
                for (int i = 0; i < var.size; i += 4) {
                    code.addText("\t\t" + "lw\t" + tmpr.toString() + "\t" + i + "(" + reg.toString() + ")");
                    code.addText("\t\t" + "sw\t" + tmpr.toString() + "\t" + i + "(" + addr.toString() + ")");
                }
            }
        } else if (var instanceof DeRefVar) {
            BasicReg reg1 = loadToReg(((DeRefVar) var).val);
            code.addText("\t\t" + (var.size == 4 ? "sw\t" : "sb\t") + reg.toString() + "\t0(" + reg1.toString() + ")");
        } else {
            code.addText("\t\t" + (var.size == 4 ? "sw\t" : "sb\t") + reg.toString() + "\t" + getAddr(var));
        }
    }

    void genInst(AssignInst inst) {
        usedReg = 0;
        if (inst.op.equals(ExprOp.asgr)) {
            BasicReg r1 = loadToReg(inst.src1);
            boolean bak = inst.dest.isStruct;
            inst.dest.isStruct = true;
            writeToMem(r1, inst.dest);
            inst.dest.isStruct = bak;
            releaseReg();
        } else if (inst.op.equals(ExprOp.asg)) {
            BasicReg r1 = loadToReg(inst.src1);
            writeToMem(r1, inst.dest);
            releaseReg();
        } else if (inst.op.equals(ExprOp.adr)) {
            BasicReg d = getReg();
            if (inst.src1 instanceof DeRefVar) {
                code.addText("\t\t" + "move" + "\t" + d.toString() + "\t" + loadToReg(((DeRefVar) inst.src1).val).toString());
            } else if (inst.src1 instanceof VarName){
                code.addText("\t\t" + "la" + "\t" + d.toString() + "\t" + getAddr((VarName) inst.src1));
            }
            writeToMem(d, inst.dest);
            releaseReg();
        } else {
            int cnt = inst.op.cnt;
            if (cnt == 1) {
                BasicReg r1 = loadToReg(inst.src1);
                BasicReg d = getReg();
                code.addText("\t\t" + inst.op.name() + "\t" + d.toString() + "\t" + r1.toString());
                writeToMem(d, inst.dest);
                releaseReg();
            } else if (cnt == 2) {
                BasicReg r1 = loadToReg(inst.src1);
                BasicReg r2 = loadToReg(inst.src2);
                BasicReg d = getReg();
                code.addText("\t\t" + inst.op.name() + "\t" + d.toString() + "\t" + r1.toString() + "\t" + r2.toString());
                writeToMem(d, inst.dest);
                releaseReg();
            }
        }
    }

    void genInst(CallInst inst) {
        alignTo(4);
        curDelta += 4;
        code.addText("\t\tsw\t$ra\t" + -curDelta + "($fp)");
        int bak = curDelta;
        LinkedList<Value> tmp = new LinkedList<>();
        for (int i = 0; i < ((IntConst)inst.num).val; ++i) {
            tmp.push(pStack.pop());
        }
        for (Value val : tmp) {
            alignTo(val.align);
            if (val instanceof VarName && ((VarName) val).isArray) {
                curDelta += 4;
                code.addText("\t\t" + "sw\t" + loadToReg(val).toString() + "\t" + -curDelta + "($fp)");
            } else {
                curDelta += val.size;
                if (val instanceof VarName && ((VarName) val).isStruct) {
                    if (val.align == 1) {
                        BasicReg addr = loadToReg(val), tmpr = getReg();
                        for (int i = 0; i < val.size; ++i) {
                            code.addText("\t\t" + "lb\t" + tmpr.toString() + "\t" + i + "(" + addr.toString() + ")");
                            code.addText("\t\t" + "sb\t" + tmpr.toString() + "\t" + (-curDelta + i) + "($fp)");
                        }
                    } else {
                        BasicReg addr = loadToReg(val), tmpr = getReg();
                        for (int i = 0; i < val.size; i += 4) {
                            code.addText("\t\t" + "lw\t" + tmpr.toString() + "\t" + i + "(" + addr.toString() + ")");
                            code.addText("\t\t" + "sw\t" + tmpr.toString() + "\t" + (-curDelta + i) + "($fp)");
                        }
                    }
                } else {
                    code.addText("\t\t" + (val.size == 4 ? "sw\t" : "sb\t") + loadToReg(val).toString() + "\t" + -curDelta + "($fp)");
                }
            }
            releaseReg();
        }
        code.addText("\t\tsub\t$fp\t" + bak);
        if (inst.func instanceof VarName && !(inst.func instanceof DeRefVar)) {
            code.addText("\t\tjal\t" + inst.func.name);
        } else {
            code.addText("\t\tjal\t" + loadToReg(inst.func));
        }
        code.addText("\t\tadd\t$fp\t" + bak);
        releaseReg();
        writeToMem(BasicReg.v0, inst.dest);
        releaseReg();
        code.addText("\t\tlw\t$ra\t" + -bak + "($fp)");
    }

    void genInst(GotoInst inst) {
        code.addText("\t\tj\t" + inst.target.name);
    }

    void genInst(IfInst inst) {
        code.addText("\t\t" + inst.op.name() + "\t" + loadToReg(inst.src1).toString() + "\t" + loadToReg(inst.src2).toString() + "\t" + inst.target.name);
        releaseReg();
    }

    void genInst(MemInst inst) {
        alignTo(inst.var.align);
        curDelta += inst.var.size;
        delta.put(inst.var, -curDelta);
    }

    public LinkedList<Value> pStack;

    void genInst(ParaInst inst) {
        pStack.push(inst.val);
    }

    void genInst(RecvInst inst) {
        alignTo(inst.var.align);
        curDelta += inst.var.size;
        delta.put(inst.var, -curDelta);
    }

    void genInst(ReturnInst inst) {
        code.addText("\t\tjr\t$ra");
    }

    @Override
    public ASMCode gen(Program prog) {
        strCnt = 0;
        code = new SPIMCode();
        addGlobal(prog.list.get(0));
        for (ProgUnit unit : prog.list) {
            if (unit.label.name.equals("__global")) {
                continue;
            }
            addFunc(unit);
        }
        addSTL();
        return code;
    }
}

package gen.advanced;

import gen.spim.*;

import java.util.HashMap;
import java.util.HashSet;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class RegisterRenaming {

    public static SPIMCode spilledCode;

    public static HashMap<SPIMInfRegister, SPIMPhysicalRegister> spills;

    public static HashMap<SPIMInfRegister, Integer> lastUse;

    public static HashSet<SPIMInfRegister> dirty;

    public static int cur;

    public static void spillAll() {
        for (SPIMInfRegister reg : dirty) {
            spilledCode.addText(new SPIMInst(SPIMOp.lw, spills.get(reg), reg.addr));
        }
        spills.clear();
        dirty.clear();
    }

    public static void spillAny() {
        SPIMInfRegister toSpill = null;
        for (SPIMInfRegister reg : spills.keySet()) {
            if (toSpill == null || lastUse.get(toSpill) > lastUse.get(reg)) {
                toSpill = reg;
            }
        }
        if (dirty.contains(toSpill)) {
            spilledCode.addText(new SPIMInst(SPIMOp.lw, spills.get(toSpill), toSpill.addr));
        }
        dirty.remove(toSpill);
        spills.remove(toSpill);
    }

    public static SPIMPhysicalRegister readTmp(SPIMInfRegister reg) {
        lastUse.put(reg, cur);
        if (spills.containsKey(reg)) {
            return spills.get(reg);
        } else if (spills.size() == 4) {
            spillAny();
        }
        for (int i = 0; i < 4; ++i) {
            if (!spills.containsValue(SPIMPhysicalRegister.getTemp(i))) {
                SPIMPhysicalRegister reg1 = SPIMPhysicalRegister.getTemp(i);
                spills.put(reg, reg1);
                return reg1;
            }
        }
        return null;
    }

    public static SPIMPhysicalRegister writeTmp(SPIMInfRegister reg) {
        lastUse.put(reg, cur);
        dirty.add(reg);
        if (spills.containsKey(reg)) {
            return spills.get(reg);
        } else if (spills.size() == 4) {
            spillAny();
        }
        for (int i = 0; i < 4; ++i) {
            if (!spills.containsValue(SPIMPhysicalRegister.getTemp(i))) {
                SPIMPhysicalRegister reg1 = SPIMPhysicalRegister.getTemp(i);
                spills.put(reg, reg1);
                return reg1;
            }
        }
        return null;
    }

    public static SPIMValue replaceRead(SPIMValue val, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table, SPIMCode code) {
        SPIMInfRegister reg = null;
        if (val instanceof SPIMInfRegister) {
            reg = (SPIMInfRegister)val;
            if (table.containsKey(reg)) {
                return table.get(reg);
            } else {
                SPIMPhysicalRegister reg1 = readTmp(reg);
                code.addText(new SPIMInst(SPIMOp.lw, reg1, reg.addr));
                return reg1;
            }
        }
        if (val instanceof SPIMAddress && ((SPIMAddress) val).regi != null) {
            if (((SPIMAddress) val).regi instanceof SPIMInfRegister) {
                reg = (SPIMInfRegister)(((SPIMAddress) val).regi);
                if (table.containsKey(reg)) {
                    ((SPIMAddress) val).regi = table.get(reg);
                } else {
                    SPIMPhysicalRegister reg1 = readTmp(reg);
                    code.addText(new SPIMInst(SPIMOp.lw, reg1, reg.addr));
                    ((SPIMAddress) val).regi = reg1;
                }
            }
        }
        return val;
    }

    public static SPIMValue replaceWrite(SPIMValue val, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table, SPIMCode code) {
        SPIMInfRegister reg = null;
        if (val instanceof SPIMInfRegister) {
            reg = (SPIMInfRegister)val;
            if (table.containsKey(reg)) {
                return table.get(reg);
            } else {
                SPIMPhysicalRegister reg1 = writeTmp(reg);
                return reg1;
            }
        }
        return val;
    }

    public static SPIMCode gen(SPIMCode code, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table) {
        spilledCode = new SPIMCode();
        spills = new HashMap<>();
        lastUse = new HashMap<>();
        dirty = new HashSet<>();
        spilledCode.data = code.data;
        cur = 0;
        for (SPIMInst inst : code.text) {
            ++cur;
            if (inst.isLeader) {
                spillAll();
            }
            if (inst.val1 != null) {
                inst.val1 = replaceRead(inst.val1, table, spilledCode);
            }
            if (inst.val2 != null) {
                inst.val2 = replaceRead(inst.val2, table, spilledCode);
            }
            if (inst.val0 != null) {
                if (inst.op.def > 0) {
                    inst.val0 = replaceWrite(inst.val0, table, spilledCode);
                } else {
                    inst.val0 = replaceRead(inst.val0, table, spilledCode);
                }
            }
            if (SPIMControlFlow.isJump(inst) || inst.label == null && inst.op.equals(SPIMOp.jal)) {
                spillAll();
            }
            spilledCode.addText(inst);
        }
        return spilledCode;
    }
}

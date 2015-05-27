package gen.advanced;

import gen.spim.*;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class RegisterRenaming {

    public static SPIMAddress writeAddr;

    public static SPIMValue replaceRead(SPIMValue val, SPIMPhysicalRegister reg1, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table, SPIMCode code) {
        SPIMInfRegister reg = null;
        if (val instanceof SPIMInfRegister) {
            reg = (SPIMInfRegister)val;
            if (table.containsKey(reg)) {
                return table.get(reg);
            } else {
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
                    code.addText(new SPIMInst(SPIMOp.lw, reg1, reg.addr));
                    ((SPIMAddress) val).regi = reg1;
                }
            }
        }
        return val;
    }

    public static SPIMValue replaceWrite(SPIMValue val, SPIMPhysicalRegister reg1, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table, SPIMCode code) {
        SPIMInfRegister reg = null;
        if (val instanceof SPIMInfRegister) {
            reg = (SPIMInfRegister)val;
            if (table.containsKey(reg)) {
                return table.get(reg);
            } else {
                writeAddr = reg.addr;
                return reg1;
            }
        }
        return val;
    }
    public static SPIMCode gen(SPIMCode code, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table) {
        SPIMCode spilledCode = new SPIMCode();
        spilledCode.data = code.data;
        for (SPIMInst inst : code.text) {
            writeAddr = null;
            if (inst.val1 != null) {
                inst.val1 = replaceRead(inst.val1, SPIMRegID.$t0.getReg(), table, spilledCode);
            }
            if (inst.val2 != null) {
                inst.val2 = replaceRead(inst.val2, SPIMRegID.$t1.getReg(), table, spilledCode);
            }
            if (inst.val0 != null) {
                if (inst.op.def > 0) {
                    inst.val0 = replaceWrite(inst.val0, SPIMRegID.$t1.getReg(), table, spilledCode);
                } else {
                    inst.val0 = replaceRead(inst.val0, SPIMRegID.$t1.getReg(), table, spilledCode);
                }
            }
            spilledCode.addText(inst);
            if (writeAddr != null) {
                spilledCode.addText(new SPIMInst(SPIMOp.sw, SPIMRegID.$t1.getReg(), writeAddr));
            }
        }
        return spilledCode;
    }
}

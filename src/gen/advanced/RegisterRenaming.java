package gen.advanced;

import gen.spim.*;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class RegisterRenaming {

    public static SPIMValue replace(SPIMValue val, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table) {
        if (val instanceof SPIMInfRegister) {
            return table.get(val);
        }
        if (val instanceof SPIMAddress && ((SPIMAddress) val).regi != null) {
            if (((SPIMAddress) val).regi instanceof SPIMInfRegister) {
                ((SPIMAddress) val).regi = table.get((((SPIMAddress) val).regi));
            }
        }
        return val;
    }

    public static SPIMCode gen(SPIMCode code, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table) {
        for (SPIMInst inst : code.text) {
            if (inst.val0 != null) {
                inst.val0 = replace(inst.val0, table);
            }
            if (inst.val1 != null) {
                inst.val1 = replace(inst.val1, table);
            }
            if (inst.val2 != null) {
                inst.val2 = replace(inst.val2, table);
            }
        }
        return code;
    }
}

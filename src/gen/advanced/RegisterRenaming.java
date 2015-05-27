package gen.advanced;

import gen.spim.SPIMCode;
import gen.spim.SPIMInst;
import gen.spim.SPIMPhysicalRegister;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class RegisterRenaming {

    public static SPIMCode gen(SPIMCode code, HashMap<SPIMInfRegister, SPIMPhysicalRegister> table) {
        for (SPIMInst inst : code.text) {
            if (inst.val0 != null && inst.val0 instanceof SPIMInfRegister) {
                inst.val0 = table.get((SPIMInfRegister)inst.val0);
            }
            if (inst.val1 != null && inst.val1 instanceof SPIMInfRegister) {
                inst.val1 = table.get((SPIMInfRegister)inst.val1);
            }
            if (inst.val2 != null && inst.val2 instanceof SPIMInfRegister) {
                inst.val2 = table.get((SPIMInfRegister)inst.val2);
            }
        }
        return code;
    }
}

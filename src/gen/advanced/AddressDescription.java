package gen.advanced;

import gen.spim.SPIMAddress;
import gen.spim.SPIMRegister;

import java.util.HashSet;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class AddressDescription {
    public SPIMAddress mem;
    public boolean inmem;
    public HashSet<SPIMRegister> regs;

    public AddressDescription() {
        mem = null;
        inmem = false;
        regs = new HashSet<>();
    }

    public AddressDescription(SPIMAddress mem) {
        mem = mem;
        inmem = false;
        regs = new HashSet<>();
    }

    public void setMem(SPIMAddress mem) {
        this.mem = mem;
    }

    public void addReg(SPIMRegister reg) {
        regs.add(reg);
    }

    public void delReg(SPIMRegister reg) {
        regs.remove(reg);
    }
}

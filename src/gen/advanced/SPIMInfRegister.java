package gen.advanced;

import gen.spim.SPIMAddress;
import gen.spim.SPIMRegister;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMInfRegister extends SPIMRegister {

    public static int cnt = 0;

    public int id;

    public SPIMAddress addr;

    public SPIMInfRegister(SPIMAddress addr) {
        this.addr = addr;
        this.id = cnt++;
    }

    static public void reset() {
        cnt = 0;
    }

    @Override
    public String print() {
        return "$I" + (this.id);
        /*
        //TODO:!!!!
        if (this.id < 8) {
            return "$t" + (this.id + 2);
        } else if (this.id - 8 < 8) {
            return "$s" + (this.id - 8);
        } else if (this.id == 16) {
            return "$v1";
        } else if (this.id == 17) {
            return "$fp";
        } else {
            throw new InternalError("Not Enough registers.");
        }*/
    }
}

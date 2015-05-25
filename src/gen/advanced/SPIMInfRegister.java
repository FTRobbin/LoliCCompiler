package gen.advanced;

import gen.spim.SPIMRegister;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMInfRegister extends SPIMRegister {

    public static int cnt = 0;

    public int id;

    public SPIMInfRegister() {
        this.id = cnt++;
    }

    @Override
    public String print() {
        return "$I" + this.id;
    }
}

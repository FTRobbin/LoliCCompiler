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

    static public void reset() {
        cnt = 0;
    }

    @Override
    public String print() {
        //TODO:!!!!
        if (this.id < 8) {
            return "$t" + (this.id + 2);
        } else {
            return "$s" + (this.id - 8);
        }
    }
}

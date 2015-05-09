package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class ParaInst extends MIRInst {

    public Value val;

    public ParaInst(Value val) {
        this.val = val;
    }

    public List<String> print() {
        return super.print("para " + val.name);
    }
}

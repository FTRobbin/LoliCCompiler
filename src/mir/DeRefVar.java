package mir;

/**
 * Created by Robbin Ni on 2015/5/18.
 */

public class DeRefVar extends VarName {

    public Value val;

    public DeRefVar(Value val) {
        this.val = val;
        this.name = "*" + val.name;
    }
}

package mir;

/**
 * Created by Robbin Ni on 2015/5/18.
 */

public class DeRefVar extends VarName {

    public Value val;

    public DeRefVar(Value val, int size, int align, boolean isArray, boolean isStruct) {
        super(null);
        this.val = val;
        this.name = "*" + val.name;
        this.size = size;
        this.align = align;
        this.isArray = isArray;
        this.isStruct = isStruct;
    }
}

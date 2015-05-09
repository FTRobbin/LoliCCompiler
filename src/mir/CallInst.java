package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class CallInst extends MIRInst {

    public VarName dest;
    public Value num;
    public Value func;

    public CallInst(VarName dest, Value num, Value func) {
        this.dest = dest;
        this.num = num;
        this.func = func;
    }

    public String print() {
        return super.print(dest.name + " = " + "call " + func.name + " " + num.name);
    }
}

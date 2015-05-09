package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class TrampInst extends MIRInst {

    public VarName func;

    public TrampInst(VarName func) {
        this.func = func;
    }

    @Override
    public List<String> print() {
        return super.print("tramp " + func.name);
    }
}

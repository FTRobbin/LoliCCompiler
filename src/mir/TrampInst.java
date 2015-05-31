package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class TrampInst extends MIRInst {

    public VarName func, tramped;

    public TrampInst(VarName tramped, VarName func) {
        this.tramped = tramped;
        this.func = func;
    }

    @Override
    public List<String> print() {
        return super.print(tramped.name + " = trampoline " + func.name);
    }
}

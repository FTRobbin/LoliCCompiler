package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class MemInst extends MIRInst {
    public VarName var;
    public int size;

    public MemInst(VarName var, Integer size) {
        this.var = var;
        this.size = size;
    }

    @Override
    public List<String> print() {
        return super.print(var.name + " <- " + "MEM[" + size + "]");
    }
}

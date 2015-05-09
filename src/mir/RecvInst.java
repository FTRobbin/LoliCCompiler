package mir;

/**
 * Created by Robbin Ni on 2015/5/8.
 */
public class RecvInst extends MIRInst {

    public VarName var;
    public int size;

    public RecvInst(VarName var, int size) {
        this.var = var;
        this.size = size;
    }

    public String print() {
        return super.print("recv " + var.name + " " + size);
    }
}

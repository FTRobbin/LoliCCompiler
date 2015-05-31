package mir;

/**
 * Created by Robbin Ni on 2015/5/10.
 */
public class SSAVarName extends VarName {

    public VarName ori;
    public int id;

    public SSAVarName(VarName var, int id) {
        super(null);
        this.isTemp = var.isTemp;
        this.ori = var;
        this.id = id;
        this.name = var.name + "_" + id;
    }

    public VarName getOriCopy() {
        VarName ret = new VarName(ori.uid, this.name, ori.size, ori.align);
        ret.name = this.name;
        return ret;
    }
}

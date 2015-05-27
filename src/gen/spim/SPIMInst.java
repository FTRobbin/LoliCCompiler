package gen.spim;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMInst {

    public SPIMOp op;
    public SPIMLabel label;
    public SPIMValue val0, val1, val2;

    public SPIMInst(SPIMLabel label) {
        op = null;
        val0 = val1 = val2 = null;
        this.label = label;
    }

    public SPIMInst(SPIMOp op, SPIMValue val0, SPIMValue val1, SPIMValue val2) {
        this.op = op;
        this.val0 = val0;
        this.val1 = val1;
        this.val2 = val2;
    }

    public SPIMInst(SPIMOp op, SPIMValue val0, SPIMValue val1) {
        this.op = op;
        this.val0 = val0;
        this.val1 = val1;
        this.val2 = null;
    }

    public SPIMInst(SPIMOp op, SPIMValue val0) {
        this.op = op;
        this.val0 = val0;
        this.val1 = null;
        this.val2 = null;
    }

    public SPIMInst(SPIMOp op) {
        this.op = op;
        this.val0 = null;
        this.val1 = null;
        this.val2 = null;
    }

    public String print() {
        if (label != null) {
            //System.out.println(label.label);
            return label.label + ":";
        } else {
            return "\t\t" + op.print(this);
        }
    }

    public boolean isLeader = false;
}

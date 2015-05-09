package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class IfInst extends BranchInst {


    public Value src1, src2;
    public RelOp op;

    public IfInst(RelOp op, Value src1, Value src2, Label target) {
        this.op = op;
        this.src1 = src1;
        this.src2 = src2;
        this.target = target;
        if (target.isDummy()) {
            target.reInit();
        }
    }

    public String print() {
        return super.print(this.op.print(this));
    }
}

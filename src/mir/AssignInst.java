package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class AssignInst extends MIRInst {

    //TODO

    public ExprOp op;
    public VarName dest;
    public Value src1, src2;

    public AssignInst(ExprOp op, VarName dest) {
        this.op = op;
        this.dest = dest;
        src1 = null;
        src2 = null;
    }

    public AssignInst(ExprOp op, VarName dest, Value src1) {
        this.op = op;
        this.dest = dest;
        this.src1 = src1;
        src2 = null;
    }

    public AssignInst(ExprOp op, VarName dest, Value src1, Value src2) {
        this.op = op;
        this.dest = dest;
        this.src1 = src1;
        this.src2 = src2;
    }

    @Override
    public List<String> print() {
        return super.print(this.op.print(this));
    }
}

package irt;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class ExSt extends Stat implements IRTNode {
    public Expr expr;

    public ExSt(Expr expr) {
        this.expr = expr;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

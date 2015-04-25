package irt;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class SeSt extends Stat implements IRTNode {

    public Expr expr;
    public Stat tr, fl;

    public SeSt(Expr expr, Stat tr, Stat fl) {
        this.expr = expr;
        this.tr = tr;
        this.fl = fl;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

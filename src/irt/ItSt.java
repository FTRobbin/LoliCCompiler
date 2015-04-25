package irt;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class ItSt extends Stat implements IRTNode {

    public Stat init, inct, stat;
    public Expr expr;

    public ItSt(Stat init, Expr expr, Stat stat, Stat inct) {
        this.init = init;
        this.expr = expr;
        this.stat = stat;
        this.inct = inct;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

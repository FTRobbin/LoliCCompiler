package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class IterationStat extends Statement implements Visible {

    public Expression init, expr, inct;
    public Statement stat;

    public IterationStat(Expression init, Expression expr, Expression inct, Statement stat) {
        this.init = init;
        this.expr = expr;
        this.inct = inct;
        this.stat = stat;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

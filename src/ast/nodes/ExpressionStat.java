package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ExpressionStat extends Statement implements Visible {

    public Expression expr;

    public ExpressionStat(Expression expr) {
        this.expr = expr;
    }

    @Override
    public boolean isEmpty() {
        return expr.isEmpty();
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ExpressionStat extends Statement implements Visiable {

    public Expression expr;

    public ExpressionStat(Expression expr) {
        this.expr = expr;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

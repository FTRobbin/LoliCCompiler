package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class BinaryExpr extends Expression implements Visible {

    public Expression expr1, expr2;
    public Integer op;

    public BinaryExpr(Expression expr1, Integer op, Expression expr2) {
        this.expr1 = expr1;
        this.op = op;
        this.expr2 = expr2;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

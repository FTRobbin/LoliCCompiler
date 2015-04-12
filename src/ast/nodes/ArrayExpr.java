package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ArrayExpr extends Expression implements Visible {
    public Expression expr, addr;

    public ArrayExpr(Expression expr, Expression addr) {
        this.expr = expr;
        this.addr = addr;
    }

    @Override
    public int getPrecedence() {
        return 13;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

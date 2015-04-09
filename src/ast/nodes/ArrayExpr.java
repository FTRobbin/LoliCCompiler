package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ArrayExpr extends Expression implements Visiable {
    public Expression expr, addr;

    public ArrayExpr(Expression expr, Expression addr) {
        this.expr = expr;
        this.addr = addr;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

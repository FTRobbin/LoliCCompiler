package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class CastExpr extends Expression implements Visible {

    public Type type;
    public Expression expr;

    public CastExpr(Type type, Expression expr) {
        this.type = type;
        this.expr = expr;
    }

    @Override
    public int getPrecedence() {
        return 14;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

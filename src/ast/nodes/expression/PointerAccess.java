package ast.nodes.expression;

import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class PointerAccess extends Expression implements Visible {

    public Expression expr;
    public Symbol id;

    public PointerAccess(Expression expr, Symbol id) {
        this.expr = expr;
        this.id = id;
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

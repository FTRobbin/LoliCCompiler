package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class PointerAccess extends Expression implements Visiable {

    public Expression expr;
    public Symbol id;

    public PointerAccess(Expression expr, Symbol id) {
        this.expr = expr;
        this.id = id;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

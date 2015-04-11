package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class SizeofExpr extends Expression implements Visible {

    public Type type;

    public SizeofExpr(Type type) {
        this.type = type;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

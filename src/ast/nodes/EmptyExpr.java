package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class EmptyExpr extends Expression implements Visible {

    @Override
    public int getPrecedence() {
        return 16;
    }

    @Override
    public boolean isEmpty() {
        return true;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

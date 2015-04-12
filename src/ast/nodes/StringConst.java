package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class StringConst extends Expression implements Visible {

    public String str;

    public StringConst(String str) {
        this.str = str;
    }

    @Override
    public int getPrecedence() {
        return 15;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

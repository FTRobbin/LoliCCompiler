package ast.nodes.expression;

import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class CharConst extends Expression implements Visible {

    public Character ch;

    public CharConst(char ch) {
        this.ch = ch;
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

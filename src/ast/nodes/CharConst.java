package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class CharConst extends Expression implements Visiable {

    public char ch;

    public CharConst(char ch) {
        this.ch = ch;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

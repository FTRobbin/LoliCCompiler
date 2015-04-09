package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class IntConst extends Expression implements Visiable {
    public int val;

    public IntConst (int val)  {
        this.val = val;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}
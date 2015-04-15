package ast.nodes.expression;

import ast.nodes.Visible;
import ast.nodes.expression.Expression;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class IntConst extends Expression implements Visible {
    public Integer val;

    public IntConst (int val)  {
        this.val = val;
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

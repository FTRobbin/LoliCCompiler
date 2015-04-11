package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class FunctionCall extends Expression implements Visible {

    public Expression func;
    public ArgumentList argu;

    public FunctionCall(Expression func, ArgumentList argu) {
        this.func = func;
        this.argu = argu;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

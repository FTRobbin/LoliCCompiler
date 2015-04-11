package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class PostExpr extends Expression implements Visible {

    public Expression expr;
    public Integer op;

    public PostExpr(Expression expr, Integer op) {
        this.expr = expr;
        this.op = op;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

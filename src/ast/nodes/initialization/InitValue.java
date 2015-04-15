package ast.nodes.initialization;

import ast.nodes.Visible;
import ast.nodes.expression.Expression;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class InitValue extends Initializer implements Visible {

    public Expression expr;

    public InitValue(Expression expr) {
        this.expr = expr;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

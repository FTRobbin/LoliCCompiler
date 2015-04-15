package ast.nodes.expression;

import ast.nodes.Visible;
import ast.nodes.expression.Expression;
import ast.nodes.expression.Symbol;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class Variable extends Expression implements Visible {

    public Symbol id;

    public Variable(Symbol id) {
        this.id = id;
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

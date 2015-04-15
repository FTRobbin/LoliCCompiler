package ast.nodes.declaration;

import ast.nodes.expression.Expression;
import ast.nodes.Visible;
import ast.visitors.Visitor;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ArgumentList implements Visible {

    public List<Expression> list;

    public ArgumentList() {
        list = new LinkedList<Expression>();
    }

    public ArgumentList add(Expression expr) {
        list.add(expr);
        return this;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

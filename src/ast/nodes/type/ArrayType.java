package ast.nodes.type;

import ast.nodes.expression.Expression;
import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class ArrayType extends PointerType implements Visible {

    public Expression cap;

    public ArrayType(Type baseType, Expression cap) {
        super(baseType);
        this.cap = cap;
    }

    @Override
    public Type getShell() {
        return new ArrayType(baseType.getShell(), cap);
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

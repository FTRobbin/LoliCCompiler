package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class PointerType extends TypeDeco implements Visible {

    public PointerType(Type baseType) {
        this.baseType = baseType;
    }

    @Override
    public Type getShell() {
        return new PointerType(baseType.getShell());
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

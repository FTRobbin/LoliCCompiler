package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class PointerType extends TypeDeco implements Visiable {

    public PointerType(Type baseType) {
        this.baseType = baseType;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

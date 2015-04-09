package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class ArrayType extends TypeDeco implements Visiable {

    public Expression cap;

    public ArrayType(Type baseType, Expression cap) {
        this.baseType = baseType;
        this.cap = cap;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

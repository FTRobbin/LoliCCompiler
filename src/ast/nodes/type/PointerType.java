package ast.nodes.type;

import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class PointerType extends Type implements Visible {

    public Type baseType;

    public PointerType(Type baseType) {
        this.baseType = baseType;
    }

    @Override
    public Type encore(Type type) {
        if (baseType == null) {
            baseType = type;
        } else {
            baseType.encore(type);
        }
        return this;
    }

    @Override
    public Type getShell() {
        return new PointerType(baseType.getShell());
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }

    @Override
    public Type clone() {
        Type ret = new PointerType(baseType);
        ret.size = this.size;
        ret.isConst = this.isConst;
        ret.isLeft = this.isLeft;
        ret.value = this.value;
        return ret;
    }
}

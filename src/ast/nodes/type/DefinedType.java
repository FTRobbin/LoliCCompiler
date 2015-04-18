package ast.nodes.type;

import ast.nodes.Visible;
import ast.nodes.expression.Symbol;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/15.
 */

public class DefinedType extends Type implements Visible {
    public Symbol name;
    public Type baseType = null;

    public DefinedType(Symbol name) {
        this.name = name;
    }

    public DefinedType(Symbol name, Type baseType) {
        this.name = name;
        this.baseType = baseType;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }


    @Override
    public Type clone() {
        Type ret = new DefinedType(name, baseType);
        ret.size = this.size;
        ret.isConst = this.isConst;
        ret.isLeft = this.isLeft;
        ret.value = this.value;
        return ret;
    }
}

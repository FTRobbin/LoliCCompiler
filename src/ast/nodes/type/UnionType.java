package ast.nodes.type;

import ast.nodes.expression.Symbol;
import ast.nodes.Visible;
import ast.nodes.declaration.DeclList;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class UnionType extends RecordType implements Visible {

    public UnionType(Symbol name, DeclList list) {
        super(name, list);
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }

    @Override
    public Type clone() {
        Type ret = new UnionType(name, null);
        ((RecordType)ret).mem = this.mem;
        ret.size = this.size;
        ret.isConst = this.isConst;
        ret.isLeft = this.isLeft;
        ret.value = this.value;
        return ret;
    }
}

package ast.nodes.type;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class ELLIPSIS extends Type {
    @Override
    public void accept(Visitor v) {

    }

    @Override
    public Type clone() {
        Type ret = new ELLIPSIS();
        ret.size = this.size;
        ret.isConst = this.isConst;
        ret.isLeft = this.isLeft;
        ret.value = this.value;
        return ret;
    }
}

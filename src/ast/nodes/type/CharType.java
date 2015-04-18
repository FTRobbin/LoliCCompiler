package ast.nodes.type;

import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class CharType extends Type implements Visible {

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }


    @Override
    public Type clone() {
        Type ret = new CharType();
        ret.size = this.size;
        ret.isConst = this.isConst;
        ret.isLeft = this.isLeft;
        ret.value = this.value;
        return ret;
    }
}

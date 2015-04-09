package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class VoidType extends Type implements Visiable {

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

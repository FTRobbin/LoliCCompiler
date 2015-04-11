package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class TypeDecl extends Declaration implements Visible {
    public Type type;

    public TypeDecl (Type type) {
        this.type = type;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

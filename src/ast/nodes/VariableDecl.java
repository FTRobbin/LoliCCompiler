package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class VariableDecl extends Declaration implements Visible {

    public VariableDecl(Type type, Symbol name, Initializer init) {
        this.type = type;
        this.name = name;
        this.init = init;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

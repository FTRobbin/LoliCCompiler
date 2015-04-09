package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class FunctionDecl extends Declaration implements Visiable {

    public DeclList para;

    public FunctionDecl(Type type, Symbol name, DeclList para) {
        this.type = type;
        this.name = name;
        this.para = para;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

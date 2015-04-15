package ast.nodes.declaration;

import ast.nodes.expression.Symbol;
import ast.nodes.type.Type;
import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public class FunctionDecl extends Declaration implements Visible {

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

package ast.nodes.declaration;

import ast.nodes.Visible;
import ast.nodes.expression.Symbol;
import ast.nodes.initialization.Initializer;
import ast.nodes.type.Type;
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

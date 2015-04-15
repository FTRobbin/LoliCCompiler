package ast.nodes.declaration;

import ast.nodes.Visible;
import ast.nodes.declaration.Declaration;
import ast.nodes.expression.Symbol;
import ast.nodes.type.Type;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class TypeDecl extends Declaration implements Visible {
    public Type type;
    public Symbol name;

    public TypeDecl (Type type, Symbol name) {
        this.type = type;
        this.name = name;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

package ast.nodes.declaration;

import ast.nodes.Visible;
import ast.nodes.expression.Symbol;
import ast.nodes.type.Type;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/16.
 */
public class TypeDecl extends Declaration implements Visible {

    public TypeDecl(Type type) {
        this.type = type;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}
package ast.nodes.type;

import ast.nodes.expression.Symbol;
import ast.nodes.Visible;
import ast.nodes.declaration.DeclList;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class StructType extends Type implements Visible {

    public Symbol name;
    public DeclList list;

    public StructType (Symbol name, DeclList list) {
        this.name = name;
        this.list = list;
    }

    @Override
    public Type getShell() {
        return null;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

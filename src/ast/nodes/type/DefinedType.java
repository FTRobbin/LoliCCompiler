package ast.nodes.type;

import ast.nodes.Visible;
import ast.nodes.expression.Symbol;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/15.
 */

public class DefinedType extends Type implements Visible {
    public Symbol name;

    public DefinedType(Symbol name) {
        this.name = name;
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

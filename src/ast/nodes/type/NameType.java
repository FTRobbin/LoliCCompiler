package ast.nodes.type;

import ast.nodes.expression.Symbol;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class NameType extends Type {
    public Symbol name;

    public NameType(Symbol name) {
        this.name = name;
    }

    @Override
    public void accept(Visitor v) {

    }
}

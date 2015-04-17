package ast.nodes.type;

import ast.nodes.expression.Symbol;
import ast.nodes.Visible;
import ast.nodes.declaration.DeclList;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class StructType extends RecordType implements Visible {

    public StructType (Symbol name, DeclList list) {
        super(name, list);
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

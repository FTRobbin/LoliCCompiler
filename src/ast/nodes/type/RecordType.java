package ast.nodes.type;

import ast.nodes.declaration.DeclList;
import ast.nodes.expression.Symbol;
import ast.visitors.Visitor;
import semantic.MemberTable;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public abstract class RecordType extends Type {
    public Symbol name;
    public DeclList list;
    public MemberTable mem = null;

    public RecordType(Symbol name, DeclList list) {
        this.name = name;
        this.list = list;
    }
}

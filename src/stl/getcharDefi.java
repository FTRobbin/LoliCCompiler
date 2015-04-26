package stl;

import ast.nodes.declaration.DeclList;
import ast.nodes.declaration.FunctionDefi;
import ast.nodes.declaration.VariableDecl;
import ast.nodes.expression.Symbol;
import ast.nodes.initialization.InitList;
import ast.nodes.statment.CompoundStat;
import ast.nodes.statment.StatList;
import ast.nodes.type.*;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/16.
 */
public class getcharDefi extends FunctionDefi {

    public getcharDefi() {
        super(new FunctionType(new CharType(), new DeclList()),
              new Symbol("getchar"), new DeclList(),
              new CompoundStat(new DeclList(), new StatList()));
        //TODO
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

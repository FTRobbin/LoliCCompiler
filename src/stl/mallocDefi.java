package stl;

import ast.nodes.declaration.DeclList;
import ast.nodes.declaration.FunctionDefi;
import ast.nodes.declaration.VariableDecl;
import ast.nodes.expression.Symbol;
import ast.nodes.initialization.InitList;
import ast.nodes.statment.CompoundStat;
import ast.nodes.statment.StatList;
import ast.nodes.type.FunctionType;
import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import ast.nodes.type.VoidType;

/**
 * Created by Robbin Ni on 2015/4/16.
 */
public class mallocDefi extends FunctionDefi {

    public mallocDefi() {
        super(new FunctionType(new PointerType(new VoidType()), (new DeclList()).add(new VariableDecl(new IntType(), new Symbol("size"), new InitList()))),
              new Symbol("malloc"),
              (new DeclList()).add(new VariableDecl(new IntType(), new Symbol("size"), new InitList())),
              new CompoundStat(new DeclList(), new StatList()));
        //TODO
    }
}

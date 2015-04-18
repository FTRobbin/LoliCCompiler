package stl;

import ast.nodes.declaration.DeclList;
import ast.nodes.declaration.FunctionDefi;
import ast.nodes.declaration.TypeDecl;
import ast.nodes.declaration.VariableDecl;
import ast.nodes.expression.Symbol;
import ast.nodes.statment.CompoundStat;
import ast.nodes.statment.StatList;
import ast.nodes.type.*;

/**
 * Created by Robbin Ni on 2015/4/16.
 */
public class scanfDefi extends FunctionDefi {

    public scanfDefi() {
        super(new FunctionType(new IntType(), new DeclList()), new Symbol("scanf"), (new DeclList()).add(new VariableDecl(new PointerType(new CharType()), new Symbol("argu"), null)), new CompoundStat(new DeclList(), new StatList()));
        this.paras.add(new TypeDecl(new ELLIPSIS()));
        this.type = new FunctionType(this.returnType, this.paras);
        //TODO
    }
}
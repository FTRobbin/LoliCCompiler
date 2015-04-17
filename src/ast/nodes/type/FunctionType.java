package ast.nodes.type;

import ast.nodes.declaration.DeclList;
import ast.nodes.declaration.Declaration;
import ast.visitors.Visitor;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class FunctionType extends Type {

    public Type returnType;
    public LinkedList<Type> paraType;

    public FunctionType(Type returnType, DeclList para) {
        this.returnType = returnType;
        this.paraType = new LinkedList<Type>();
        for (Declaration decl : para.list) {
            paraType.add(decl.type);
        }
    }

    @Override
    public Type encore(Type type) {
        if (returnType == null) {
            returnType = type;
        } else {
            returnType = returnType.encore(type);
        }
        return this;
    }

    @Override
    public void accept(Visitor v) {
        returnType.accept(v);
    }
}

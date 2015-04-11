package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class FunctionDefi extends Declaration implements Visible {

    public Type returnType;
    public Symbol name;
    public DeclList paras;
    public CompoundStat body;

    public FunctionDefi(Type returnType, Symbol name, DeclList paras, CompoundStat body) {
        this.returnType = returnType;
        this.name = name;
        this.paras = paras;
        this.body = body;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

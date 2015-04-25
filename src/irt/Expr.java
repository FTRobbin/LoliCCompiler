package irt;

import ast.nodes.type.Type;
import irt.factory.OpFactory;
import irt.factory.Op;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Expr implements IRTNode {

    public LinkedList<Expr> exprs;
    public LinkedList<Object> consts;
    public Op op;

    public Type retType;
    public int retSize;
    public boolean isConst, isLeft, isStatic;
    public Object value;

    public Expr(LinkedList<Expr> exprs, LinkedList<Object> consts, OpFactory fact) {
        this.exprs = exprs;
        this.consts = consts;
        this.value = null;
        this.op = fact.createOp(this);
    }

    public void setValue(Type retType, boolean isConst, boolean isLeft, Object value) {
        this.retType = retType;
        this.retSize = retType.size;
        this.isConst = isConst;
        this.isLeft = isLeft;
        this.value = value;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

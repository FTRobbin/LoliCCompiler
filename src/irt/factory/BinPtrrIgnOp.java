package irt.factory;

import ast.nodes.type.PointerType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class BinPtrrIgnOp extends Op {

    BinIntFact.Ops op;

    public BinPtrrIgnOp(Expr expr, BinIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        expr.setValue(expr.exprs.get(0).retType, false, true, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = expr.exprs.get(0).accept(v);
        int delta = v.fetchInt(addr) * ((PointerType)(expr.exprs.get(1).retType)).baseType.size;
        return v.writeInt(addr, op.cal(delta, v.fetchInt(expr.exprs.get(1).accept(v))));
    }
}

package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class BinIntIgnOp extends Op {

    BinIntFact.Ops op;

    public BinIntIgnOp(Expr expr, BinIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        expr.setValue(expr.exprs.get(0).retType, false, true, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = expr.exprs.get(0).accept(v);
        int val = op.cal(v.fetchInt(addr), v.fetchInt(expr.exprs.get(1).accept(v)));
        return v.writeInt(addr, val);
    }
}

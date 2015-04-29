package irt.factory;

import ast.nodes.type.PointerType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class BinPtrlOp extends Op {

    BinIntFact.Ops op;

    public BinPtrlOp(Expr expr, BinIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        if (expr.exprs.get(0).isConst && expr.exprs.get(1).isConst) {
            expr.setValue(expr.exprs.get(0).retType, true, false, false, null);
        } else {
            expr.setValue(expr.exprs.get(0).retType, false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = v.fetchInt(expr.exprs.get(0).accept(v));
        int delta = v.fetchInt(expr.exprs.get(1).accept(v)) * ((PointerType)(expr.exprs.get(0).retType)).baseType.size;
        return v.writeInt(v.newInt(), op.cal(addr, delta));
    }
}

package irt.factory;

import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class AssignOp extends Op {

    int size;

    public AssignOp(Expr expr, int size) {
        this.expr = expr;
        this.size = size;
        expr.setValue(expr.exprs.get(0).retType, false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = expr.exprs.get(0).accept(v);
        int val = expr.exprs.get(1).accept(v);
        for (int i = 0; i < size; ++i) {
            v.writeByte(addr + i, v.fetchByte(val + i));
        }
        return addr;
    }
}

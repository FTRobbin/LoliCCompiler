package irt.factory;

import interpreter.Interpreter;
import irt.Expr;
import parser.Symbols;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class UniIncIntOp extends Op {

    int delta;

    public UniIncIntOp(Expr expr, int op, int delta) {
        this.expr = expr;
        this.delta = delta * (op == Symbols.INC_OP ? 1 : -1);
        expr.setValue(expr.exprs.get(0).retType, false, false, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = this.expr.exprs.get(0).accept(v);
        int val = v.fetchInt(addr) + delta;
        v.writeInt(v.newInt(), val);
        return v.writeInt(addr, val);
    }
}

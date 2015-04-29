package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class SubPtrOp extends Op {
    int size;

    public SubPtrOp(Expr expr, int size) {
        this.expr = expr;
        this.size = size;
        if (expr.exprs.get(0).isConst && expr.exprs.get(1).isConst) {
            expr.setValue(new IntType(), true, false, false, null);
        } else {
            expr.setValue(new IntType(), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int addr1 = v.fetchInt(expr.exprs.get(0).accept(v));
        int addr2 = v.fetchInt(expr.exprs.get(1).accept(v));
        return v.writeInt(v.newInt(), (addr1 - addr2) / size);
    }
}

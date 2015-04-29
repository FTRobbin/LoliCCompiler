package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class SubPtrIgnOp extends Op {
    int size;

    public SubPtrIgnOp(Expr expr, int size) {
        this.expr = expr;
        this.size = size;
        expr.setValue(new IntType(), false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr1 = expr.exprs.get(0).accept(v);
        int addr2 = v.fetchInt(expr.exprs.get(1).accept(v));
        return v.writeInt(addr1, (v.fetchInt(addr1) - addr2) / size);
    }
}

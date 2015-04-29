package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class PointOp extends Op{

    int delta;

    public PointOp(Expr expr, Type ret, int delta) {
        this.expr = expr;
        this.delta = delta;
        expr.setValue(ret, false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = v.fetchInt(expr.exprs.get(0).accept(v));
        if (expr.retType instanceof ArrayType) {
            return v.writeInt(v.newInt(), addr + delta);
        } else {
            return addr + delta;
        }
    }
}

package irt.factory;

import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CastBtoIOp extends Op{

    public CastBtoIOp(Expr expr) {
        this.expr = expr;
        if (expr.exprs.get(0).isConst) {
            int val = (int)(((Character)(expr.exprs.get(0).value)).charValue());
            expr.setValue((Type)(expr.consts.get(0)), true, false, false, val);
        } else {
            expr.setValue((Type) (expr.consts.get(0)), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), v.getBit(v.fetchByte(expr.exprs.get(0).accept(v))));
    }
}

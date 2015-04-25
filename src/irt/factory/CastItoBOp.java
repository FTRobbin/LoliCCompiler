package irt.factory;

import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CastItoBOp extends Op{

    public CastItoBOp(Expr expr) {
        this.expr = expr;
        if (expr.exprs.get(0).isConst) {
            byte val = (byte)((Integer)(expr.exprs.get(0).value)).intValue();
            expr.setValue((Type)(expr.consts.get(0)), true, false, val);
        } else {
            expr.setValue((Type) (expr.consts.get(0)), false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeByte(v.newByte(), (byte)(v.fetchInt(expr.exprs.get(0).accept(v))));
    }
}

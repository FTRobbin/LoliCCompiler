package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class IntOp extends Op {

    public IntOp(Expr expr) {
        this.expr = expr;
        expr.setValue(new IntType(), true, false, false, expr.consts.get(0));
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), (int)(expr.consts.get(0)));
    }
}

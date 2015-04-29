package irt.factory;

import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class RefOp extends Op {

    public RefOp(Expr expr, Type type) {
        this.expr = expr;
        expr.setValue(type, false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        return v.fetchInt(expr.exprs.get(0).accept(v));
    }
}

package irt.factory;

import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CommaOp extends Op {

    public CommaOp(Expr expr) {
        this.expr = expr;
        if (expr.exprs.get(1).isConst) {
            expr.setValue(expr.exprs.get(1).retType, true, false, false, expr.exprs.get(1).value);
        } else {
            expr.setValue(expr.exprs.get(1).retType, false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        expr.exprs.get(0).accept(v);
        return expr.exprs.get(1).accept(v);
    }
}

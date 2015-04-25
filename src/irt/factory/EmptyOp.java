package irt.factory;

import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class EmptyOp extends Op {

    public EmptyOp(Expr expr) {
        this.expr = expr;
    }

    @Override
    public int interpret(Interpreter v) {
        return 0;
    }
}

package irt.factory;

import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public abstract class Op {
    Expr expr;

    public abstract int interpret(Interpreter v);
}

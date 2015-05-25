package irt.factory;

import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public abstract class Op {
    Expr expr;

    public abstract int interpret(Interpreter v);

    public abstract Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret);
}

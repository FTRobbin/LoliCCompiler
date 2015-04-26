package irt.factory;

import ast.nodes.type.CharType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class CharOp extends Op {

    public CharOp(Expr expr) {
        this.expr = expr;
        expr.setValue(new CharType(), true, false, expr.consts.get(0));
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeByte(v.newByte(), (byte)((Character)expr.consts.get(0)).charValue());
    }
}

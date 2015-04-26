package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class VariOp extends Op{

    public VariOp(Expr expr) {
        this.expr = expr;
        expr.setValue((Type)expr.consts.get(1),
                false, !(((Type)expr.consts.get(1)) instanceof ArrayType), null);
    }

    @Override
    public int interpret(Interpreter v) {
        if (expr.retType instanceof ArrayType) {
            return v.writeInt(v.newInt(), v.getId((Integer)expr.consts.get(0)));
        } else {
            return v.getId((Integer) (expr.consts.get(0)));
        }
    }
}

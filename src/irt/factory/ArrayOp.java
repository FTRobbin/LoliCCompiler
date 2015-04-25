package irt.factory;

import ast.nodes.type.ArrayType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class ArrayOp extends Op {

    public ArrayOp(Expr expr) {
        this.expr = expr;
        expr.setValue(((ArrayType)expr.exprs.get(0).retType).baseType,
                false, true, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = v.fetchInt(this.expr.exprs.get(0).accept(v));
        int delta = v.fetchInt(this.expr.exprs.get(1).accept(v));
        int size = this.expr.retSize;
        return addr + delta * size;
    }
}

package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.PointerType;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class ArrayOp extends Op {

    public ArrayOp(Expr expr) {
        this.expr = expr;
        Type type = ((PointerType)expr.exprs.get(0).retType).baseType;
        if (type instanceof ArrayType) {
            expr.setValue(((PointerType)expr.exprs.get(0).retType).baseType,
                    true, true, false, null);
        } else {
            expr.setValue(((PointerType)expr.exprs.get(0).retType).baseType,
                    false, true, true, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = v.fetchInt(this.expr.exprs.get(0).accept(v));
        int delta = v.fetchInt(this.expr.exprs.get(1).accept(v));
        int size = this.expr.retType.size;
        int ret = addr + delta * size;
        if (expr.retType instanceof ArrayType) {
            return v.writeInt(v.newInt(), ret);
        } else {
            return ret;
        }
    }
}

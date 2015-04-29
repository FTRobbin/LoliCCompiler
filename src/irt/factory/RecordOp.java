package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.RecordType;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class RecordOp extends Op{

    int delta;

    public RecordOp(Expr expr, int delta) {
        this.expr = expr;
        this.delta = delta;
        Type type = ((RecordType)(expr.exprs.get(0).retType)).mem.getId((Integer)(expr.consts.get(0)));
        if (type instanceof ArrayType) {
            expr.setValue(((RecordType)(expr.exprs.get(0).retType)).mem.getId((Integer)(expr.consts.get(0))),
                    true, false, false, null);
        } else {
            expr.setValue(((RecordType)(expr.exprs.get(0).retType)).mem.getId((Integer)(expr.consts.get(0))),
                    false, true, true, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = expr.exprs.get(0).accept(v);
        if (expr.retType instanceof ArrayType) {
            return v.writeInt(v.newInt(), addr + delta);
        } else {
            return addr + delta;
        }
    }
}

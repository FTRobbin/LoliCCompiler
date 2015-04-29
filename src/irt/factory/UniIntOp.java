package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class UniIntOp extends Op {

    UniIntFact.Ops op;

    public UniIntOp(Expr expr, UniIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        if (expr.exprs.get(0).isConst) {
            int val = this.op.cal((Integer)expr.exprs.get(0).value);
            expr.setValue(new IntType(), true, false, false, val);
        } else {
            expr.setValue(new IntType(), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int val = v.fetchInt(expr.exprs.get(0).accept(v));
        return v.writeInt(v.newInt(), op.cal(val));
    }
}

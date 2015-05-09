package irt.factory;

import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

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

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label mid = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, mid);
        Value src2 = gen.gen(mid, expr.exprs.get(1), list, next);
        return src2;
    }
}

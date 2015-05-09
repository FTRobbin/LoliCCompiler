package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class BinIntOp extends Op {

    BinIntFact.Ops op;

    public BinIntOp(Expr expr, BinIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (expr1.isConst && expr2.isConst) {
            Integer val = null;
            if (expr1.value != null && expr2.value != null) {
                val = this.op.cal((Integer) expr1.value, (Integer) expr2.value);
            }
            expr.setValue(new IntType(), true, false, false, val);
        } else {
            expr.setValue(new IntType(), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), op.cal(v.fetchInt(expr.exprs.get(0).accept(v)),
                                             v.fetchInt(expr.exprs.get(1).accept(v))));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label mid = new Label(Label.DUMMY), tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, mid);
        Value src2 = gen.gen(mid, expr.exprs.get(1), list, tcur);
        VarName dest = new VarName();
        list.add((new AssignInst(this.op.IROp(), dest, src1, src2)).setLabel(tcur));
        return dest;
    }
}

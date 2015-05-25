package irt.factory;

import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class BinIntIgnCOp extends Op {

    BinIntFact.Ops op;

    public BinIntIgnCOp(Expr expr, BinIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        expr.setValue(expr.exprs.get(0).retType, false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = expr.exprs.get(0).accept(v);
        int val = op.cal(v.getBit(v.fetchByte(addr)), v.fetchInt(expr.exprs.get(1).accept(v)));
        return v.writeByte(addr, (byte)val);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        Label mid = new Label(Label.DUMMY), tcur = new Label(Label.DUMMY);
        VarName src1 = (VarName)gen.gen(cur, expr.exprs.get(0), list, mid, VarName.getAbsTmp());
        Value src2 = gen.gen(mid, expr.exprs.get(1), list, tcur, VarName.getAbsTmp());
        list.add((new AssignInst(this.op.IROp(), src1, src1, src2)).setLabel(tcur));
        if (ret != null && !ret.isAbsTmp()) {
            list.add(new AssignInst(ExprOp.asg, ret, src1));
            return ret;
        } else {
            return src1;
        }
    }
}

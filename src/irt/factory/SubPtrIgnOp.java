package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class SubPtrIgnOp extends Op {
    int size;

    public SubPtrIgnOp(Expr expr, int size) {
        this.expr = expr;
        this.size = size;
        expr.setValue(new IntType(), false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr1 = expr.exprs.get(0).accept(v);
        int addr2 = v.fetchInt(expr.exprs.get(1).accept(v));
        return v.writeInt(addr1, (v.fetchInt(addr1) - addr2) / size);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label mid = new Label(Label.DUMMY), tcur = new Label(Label.DUMMY);
        VarName src1 = (VarName)gen.gen(cur, expr.exprs.get(0), list, mid);
        Value src2 = gen.gen(mid, expr.exprs.get(1), list, tcur);
        VarName tmp = VarName.getTmp();
        list.add((new AssignInst(ExprOp.sub, tmp, src1, src2)).setLabel(tcur));
        list.add((new AssignInst(ExprOp.div, src1, tmp, new IntConst(size))).setLabel(tcur));
        return src1;
    }
}

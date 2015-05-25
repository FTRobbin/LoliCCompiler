package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class SubPtrOp extends Op {
    int size;

    public SubPtrOp(Expr expr, int size) {
        this.expr = expr;
        this.size = size;
        if (expr.exprs.get(0).isConst && expr.exprs.get(1).isConst) {
            expr.setValue(new IntType(), true, false, false, null);
        } else {
            expr.setValue(new IntType(), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int addr1 = v.fetchInt(expr.exprs.get(0).accept(v));
        int addr2 = v.fetchInt(expr.exprs.get(1).accept(v));
        return v.writeInt(v.newInt(), (addr1 - addr2) / size);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (ret == null) {
            Label mid = new Label(Label.DUMMY);
            gen.gen(cur, expr.exprs.get(0), list, mid, null);
            gen.gen(mid, expr.exprs.get(1), list, next, null);
            return null;
        }
        Label mid = new Label(Label.DUMMY), tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, mid, VarName.getAbsTmp());
        Value src2 = gen.gen(mid, expr.exprs.get(1), list, tcur, VarName.getAbsTmp());
        VarName tmp = VarName.getTmp();
        list.add((new AssignInst(ExprOp.sub, tmp, src1, src2)).setLabel(tcur));
        VarName dest = ret.isAbsTmp() ? VarName.getTmp() : ret;
        list.add((new AssignInst(ExprOp.div, dest, tmp, new IntConst(size))).setLabel(tcur));
        return dest;
    }
}

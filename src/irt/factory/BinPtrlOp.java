package irt.factory;

import ast.nodes.type.PointerType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class BinPtrlOp extends Op {

    BinIntFact.Ops op;

    public BinPtrlOp(Expr expr, BinIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        if (expr.exprs.get(0).isConst && expr.exprs.get(1).isConst) {
            expr.setValue(expr.exprs.get(0).retType, true, false, false, null);
        } else {
            expr.setValue(expr.exprs.get(0).retType, false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = v.fetchInt(expr.exprs.get(0).accept(v));
        int delta = v.fetchInt(expr.exprs.get(1).accept(v)) * ((PointerType)(expr.exprs.get(0).retType)).baseType.size;
        return v.writeInt(v.newInt(), op.cal(addr, delta));
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
        list.add((new AssignInst(ExprOp.mul, tmp, src2, new IntConst(((PointerType)(expr.exprs.get(0).retType)).baseType.size))).setLabel(tcur));
        VarName dest = ret.isAbsTmp() ? VarName.getTmp() : ret;
        list.add(new AssignInst(this.op.IROp(), dest, src1, tmp));
        return dest;
    }
}

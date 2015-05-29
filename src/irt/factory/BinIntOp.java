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

    public BinIntFact.Ops op;

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
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (expr.isConst) {
            if (ret == null) {
                return null;
            }
            if (ret.isAbsTmp()) {
                if (!cur.isDummy() && (ret == null || ret.isAbsTmp())) {
                    list.add((new EmptyInst()).setLabel(cur));
                }
                return new IntConst((Integer)expr.value);
            } else {
                list.add((new AssignInst(ExprOp.asg, ret, new IntConst((Integer) expr.value))).setLabel(cur));
                return ret;
            }
        }
        if (this.op.equals(BinIntFact.Ops.ADD)) {
            if (expr.exprs.get(0).isConst && (Integer)expr.exprs.get(0).value == 0) {
                if (ret == null) {
                    gen.gen(cur, expr.exprs.get(1), list, next, null);
                    return null;
                }
                return gen.gen(cur, expr.exprs.get(1), list, next, ret);
            }
            if (expr.exprs.get(1).isConst && (Integer)expr.exprs.get(1).value == 0) {
                if (ret == null) {
                    gen.gen(cur, expr.exprs.get(0), list, next, null);
                    return null;
                }
                return gen.gen(cur, expr.exprs.get(0), list, next, ret);
            }
        }
        if (this.op.equals(BinIntFact.Ops.MUL)) {
            if (expr.exprs.get(0).isConst && (Integer)expr.exprs.get(0).value == 1) {
                if (ret == null) {
                    gen.gen(cur, expr.exprs.get(1), list, next, null);
                    return null;
                }
                return gen.gen(cur, expr.exprs.get(1), list, next, ret);
            }
            if (expr.exprs.get(1).isConst && (Integer)expr.exprs.get(1).value == 1) {
                if (ret == null) {
                    gen.gen(cur, expr.exprs.get(0), list, next, null);
                    return null;
                }
                return gen.gen(cur, expr.exprs.get(0), list, next, ret);
            }
        }
        if (ret == null) {
            Label mid = new Label(Label.DUMMY);
            gen.gen(cur, expr.exprs.get(0), list, mid, null);
            gen.gen(mid, expr.exprs.get(1), list, next, null);
            return null;
        }
        Label mid = new Label(Label.DUMMY), tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, mid, VarName.getAbsTmp());
        Value src2 = gen.gen(mid, expr.exprs.get(1), list, tcur, VarName.getAbsTmp());
        VarName dest = ret.isAbsTmp() ? VarName.getTmp() : ret;
        if (this.op.changeAble() && gen.hasMerit(src1) && !gen.hasMerit(src2)) {
            list.add((new AssignInst(this.op.changedOp().IROp(), dest, src2, src1)).setLabel(tcur));
        } else {
            list.add((new AssignInst(this.op.IROp(), dest, src1, src2)).setLabel(tcur));
        }
        return dest;
    }
}

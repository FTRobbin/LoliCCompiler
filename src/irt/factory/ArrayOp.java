package irt.factory;

import ast.nodes.type.*;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;
import semantic.IRTBuilder;

import java.util.List;

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
        list.add(new AssignInst(ExprOp.mul, tmp, src2, new IntConst(this.expr.retType.size)).setLabel(tcur));
        if (ret.isAbsTmp()) {
            VarName dest = VarName.getTmp();
            list.add(new AssignInst(ExprOp.add, dest, src1, tmp));
            if (expr.retType instanceof ArrayType || expr.retType instanceof FunctionType || expr.retType instanceof RecordType) {
                return dest;
            } else {
                return new DeRefVar(dest, expr.retSize, IRTBuilder.getAlignSize(expr.retType), expr.retType instanceof ArrayType, expr.retType instanceof RecordType);
            }
        } else {
            if (expr.retType instanceof ArrayType || expr.retType instanceof FunctionType || expr.retType instanceof RecordType) {
                list.add(new AssignInst(ExprOp.add, ret, src1, tmp));
                return ret;
            } else {
                VarName dest = VarName.getTmp();
                list.add(new AssignInst(ExprOp.add, dest, src1, tmp));
                VarName val = new DeRefVar(dest, expr.retSize, IRTBuilder.getAlignSize(expr.retType), expr.retType instanceof ArrayType, expr.retType instanceof RecordType);
                list.add(new AssignInst(ExprOp.asg, ret, val));
                return ret;
            }
        }
    }
}

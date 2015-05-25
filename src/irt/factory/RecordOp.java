package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.FunctionType;
import ast.nodes.type.RecordType;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;
import semantic.IRTBuilder;

import java.util.List;

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

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (ret == null) {
            gen.gen(cur, expr.exprs.get(0), list, next, null);
            return null;
        }
        Label tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, tcur, VarName.getAbsTmp());
        if (ret.isAbsTmp()) {
            VarName dest = VarName.getTmp();
            list.add(new AssignInst(ExprOp.add, dest, src1, new IntConst(delta)));
            if (expr.retType instanceof ArrayType || expr.retType instanceof FunctionType || expr.retType instanceof RecordType) {
                return dest;
            } else {
                return new DeRefVar(dest, expr.retSize, IRTBuilder.getAlignSize(expr.retType), expr.retType instanceof ArrayType, expr.retType instanceof RecordType);
            }
        } else {
            if (expr.retType instanceof ArrayType || expr.retType instanceof FunctionType || expr.retType instanceof RecordType) {
                list.add(new AssignInst(ExprOp.add, ret, src1, new IntConst(delta)));
                return ret;
            } else {
                VarName dest = VarName.getTmp();
                list.add(new AssignInst(ExprOp.add, dest, src1, new IntConst(delta)));
                VarName val = new DeRefVar(dest, expr.retSize, IRTBuilder.getAlignSize(expr.retType), expr.retType instanceof ArrayType, expr.retType instanceof RecordType);
                list.add(new AssignInst(ExprOp.asg, ret, val));
                return ret;
            }
        }
    }
}

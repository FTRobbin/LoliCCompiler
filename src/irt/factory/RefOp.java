package irt.factory;

import ast.nodes.type.ArrayType;
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
public class RefOp extends Op {

    public RefOp(Expr expr, Type type) {
        this.expr = expr;
        expr.setValue(type, false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        return v.fetchInt(expr.exprs.get(0).accept(v));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (ret == null) {
            gen.gen(cur, expr.exprs.get(0), list, next, null);
            return null;
        }
        Label tcur = new Label(Label.DUMMY);
        //TODO : Label bug!!
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, tcur, VarName.getAbsTmp());
        Value ret1 = null;
        if (src1 instanceof DeRefVar) {
            VarName dest = VarName.getTmp();
            list.add((new AssignInst(ExprOp.asg, dest, src1)).setLabel(tcur));
            ret1 = new DeRefVar(dest, expr.retSize, IRTBuilder.getAlignSize(expr.retType), expr.retType instanceof ArrayType, expr.retType instanceof RecordType);
        } else {
            ret1 = new DeRefVar(src1, expr.retSize, IRTBuilder.getAlignSize(expr.retType), expr.retType instanceof ArrayType, expr.retType instanceof RecordType);
        }
        if (ret.isAbsTmp()) {
            return ret1;
        } else {
            list.add(new AssignInst(ExprOp.asg, ret, ret1));
            return ret;
        }
    }
}

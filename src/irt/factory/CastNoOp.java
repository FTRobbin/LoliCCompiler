package irt.factory;

import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CastNoOp extends Op{

    public CastNoOp(Expr expr) {
        this.expr = expr;
        Expr expr1 = expr.exprs.get(0);
        expr.setValue((Type)(expr.consts.get(0)), expr1.isConst, false, false, expr1.value);
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), v.fetchInt(expr.exprs.get(0).accept(v)));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, tcur);
        VarName dest = new VarName();
        list.add((new AssignInst(ExprOp.asg, dest, src1)).setLabel(tcur));
        return dest;
    }
}

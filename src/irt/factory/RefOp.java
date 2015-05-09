package irt.factory;

import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

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
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, tcur);
        VarName dest = new VarName();
        list.add((new AssignInst(ExprOp.ref, dest, src1)).setLabel(tcur));
        return dest;
    }
}

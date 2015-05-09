package irt.factory;

import ast.nodes.type.PointerType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class AdrOp extends Op {

    public AdrOp(Expr expr) {
        this.expr = expr;
        expr.setValue(new PointerType(expr.exprs.get(0).retType), expr.exprs.get(0).isLoad, false, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), expr.exprs.get(0).accept(v));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label tcur = new Label(Label.DUMMY);
        VarName src1 = (VarName)gen.gen(cur, expr.exprs.get(0), list, tcur);
        VarName dest = new VarName();
        list.add((new AssignInst(ExprOp.adr, dest, src1)).setLabel(tcur));
        return dest;
    }
}

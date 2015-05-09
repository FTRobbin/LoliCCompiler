package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class PointOp extends Op{

    int delta;

    public PointOp(Expr expr, Type ret, int delta) {
        this.expr = expr;
        this.delta = delta;
        expr.setValue(ret, false, true, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = v.fetchInt(expr.exprs.get(0).accept(v));
        if (expr.retType instanceof ArrayType) {
            return v.writeInt(v.newInt(), addr + delta);
        } else {
            return addr + delta;
        }
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, tcur);
        VarName dest = new VarName();
        list.add((new AssignInst(ExprOp.add, dest, src1, new IntConst(delta)).setLabel(tcur)));
        if (expr.retType instanceof ArrayType) {
            list.add(new AssignInst(ExprOp.adr, dest, dest));
        }
        return dest;
    }
}

package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class IntOp extends Op {

    public IntOp(Expr expr) {
        this.expr = expr;
        expr.setValue(new IntType(), true, false, false, expr.consts.get(0));
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), (int)(expr.consts.get(0)));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (!cur.isDummy() && (ret == null || ret.isAbsTmp())) {
            list.add((new EmptyInst()).setLabel(cur));
        }
        if (ret == null) {
            return null;
        } else if (ret.isAbsTmp()) {
            return new IntConst((int) this.expr.consts.get(0));
        } else {
            list.add(new AssignInst(ExprOp.asg, ret, new IntConst((int) this.expr.consts.get(0))).setLabel(cur));
            return ret;
        }
    }
}

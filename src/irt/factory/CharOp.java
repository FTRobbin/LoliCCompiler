package irt.factory;

import ast.nodes.type.CharType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class CharOp extends Op {

    public CharOp(Expr expr) {
        this.expr = expr;
        expr.setValue(new CharType(), true, false, false, expr.consts.get(0));
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeByte(v.newByte(), (byte)((Character)expr.consts.get(0)).charValue());
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (!cur.isDummy() && (ret == null || ret.isAbsTmp())) {
            list.add((new EmptyInst()).setLabel(cur));
        }
        if (ret == null) {
            return null;
        } else if (ret.isAbsTmp()) {
            return new CharConst((Character) this.expr.consts.get(0));
        } else {
            list.add(new AssignInst(ExprOp.asg, ret, new CharConst((Character) this.expr.consts.get(0))).setLabel(cur));
            return ret;
        }
    }
}

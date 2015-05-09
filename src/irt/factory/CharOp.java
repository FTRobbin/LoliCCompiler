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
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        if (!cur.isDummy()) {
            list.add((new EmptyInst()).setLabel(cur));
        }
        return new CharConst((Character) this.expr.consts.get(0));
    }
}

package irt.factory;

import interpreter.Interpreter;
import irt.Expr;
import mir.*;
import parser.Symbols;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class PostByteOp extends Op {

    int delta;

    public PostByteOp(Expr expr, int op, int delta) {
        this.expr = expr;
        this.delta = delta * (op == Symbols.INC_OP ? 1 : -1);
        expr.setValue(expr.exprs.get(0).retType, false, false, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int addr = this.expr.exprs.get(0).accept(v);
        byte val = v.fetchByte(addr);
        v.writeByte(addr, (byte)(val + delta));
        return v.writeByte(v.newByte(), val);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label tcur = new Label(Label.DUMMY);
        VarName src1 = (VarName)gen.gen(cur, expr.exprs.get(0), list, tcur);
        VarName dest = VarName.getTmp();
        list.add((new AssignInst(ExprOp.asg, dest, src1)).setLabel(tcur));
        list.add(new AssignInst(delta < 0 ? ExprOp.sub : ExprOp.add, src1, src1, new IntConst(Math.abs(delta))));
        return dest;
    }
}

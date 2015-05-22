package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class UniIntOp extends Op {

    public UniIntFact.Ops op;

    public UniIntOp(Expr expr, UniIntFact.Ops op) {
        this.expr = expr;
        this.op = op;
        if (expr.exprs.get(0).isConst) {
            int val = this.op.cal((Integer)expr.exprs.get(0).value);
            expr.setValue(new IntType(), true, false, false, val);
        } else {
            expr.setValue(new IntType(), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int val = v.fetchInt(expr.exprs.get(0).accept(v));
        return v.writeInt(v.newInt(), op.cal(val));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        Label tcur = new Label(Label.DUMMY);
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, tcur);
        VarName dest = VarName.getTmp();
        if (op.equals(UniIntFact.Ops.NOT)) {
            Label istr = new Label(Label.DUMMY);
            list.add((new IfInst(RelOp.beq, src1, new IntConst(0), istr)).setLabel(tcur));
            list.add((new AssignInst(ExprOp.asg, dest, new IntConst(0))));
            list.add((new GotoInst(next)));
            list.add((new AssignInst(ExprOp.asg, dest, new IntConst(1))).setLabel(istr));
        } else {
            list.add((new AssignInst(op.IROp(), dest, src1)).setLabel(tcur));
        }
        return dest;
    }
}

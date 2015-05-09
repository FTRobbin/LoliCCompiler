package irt.factory;

import ast.nodes.type.IntType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */

//TODO : known bug cannot figure whether there are writes in the expr will fix this in static optimization

public class SpRelOp extends Op {

    int op;

    public SpRelOp(Expr expr, int op) {
        this.expr = expr;
        this.op = op;
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (op == SPRelFact.OR) {
            if (expr1.value != null && (Integer) expr1.value != 0) {
                expr.setValue(new IntType(), true, false, false, 1);
            } else if (expr2.value != null && (Integer) expr2.value != 0) {
                expr.setValue(new IntType(), true, false, false, 1);
            } else if (expr1.value != null && expr2.value != null) {
                expr.setValue(new IntType(), true, false, false, 0);
            } else {
                expr.setValue(new IntType(), false, false, false, null);
            }
        } else {
            if (expr1.value != null && (Integer) expr1.value == 0) {
                expr.setValue(new IntType(), true, false, false, 0);
            } else if (expr2.value != null && (Integer) expr2.value == 0) {
                expr.setValue(new IntType(), true, false, false, 0);
            } else if (expr1.value != null && expr2.value != null) {
                expr.setValue(new IntType(), true, false, false, 1);
            } else {
                expr.setValue(new IntType(), false, false, false, null);
            }
        }
    }

    @Override
    public int interpret(Interpreter v) {
        int ret = v.fetchInt(expr.exprs.get(0).accept(v));
        if (op == SPRelFact.OR ? ret == 0 : ret != 0) {
            ret = v.fetchInt(expr.exprs.get(1).accept(v));
        }
        return v.writeInt(v.newInt(), ret == 0 ? 0 : 1);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        int tag = this.op; //OR = 1 AND = 0
        Label br1 = new Label(Label.DUMMY), br2 = new Label(Label.DUMMY), istr = new Label(Label.DUMMY);
        VarName dest = null;
        Value src1 = gen.gen(cur, expr.exprs.get(0), list, br1);
        list.add((new IfInst(RelOp.beq, src1, new IntConst(tag), istr)).setLabel(br1));
        Value src2 = gen.gen(new Label(Label.DUMMY), expr.exprs.get(1), list, br2);
        list.add((new IfInst(RelOp.beq, src2, new IntConst(tag), istr)).setLabel(br2));
        dest = new VarName();
        list.add((new AssignInst(ExprOp.asg, dest, new IntConst(1 - tag))));
        list.add((new GotoInst(next)));
        list.add((new AssignInst(ExprOp.asg, dest, new IntConst(tag))).setLabel(istr));
        return dest;
    }
}

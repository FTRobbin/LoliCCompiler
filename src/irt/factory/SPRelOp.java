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

public class SPRelOp extends Op {

    int op;

    public SPRelOp(Expr expr, int op) {
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
        Label br1 = new Label(Label.DUMMY), br2 = new Label(Label.FALL | Label.DUMMY), istr = new Label(Label.DUMMY), isfl = new Label(Label.FALL | Label.DUMMY);
        VarName dest = null;
        if (tag == 1) {
            list.addAll(gen.genRel(cur, expr.exprs.get(0), istr, br2));
            list.addAll(gen.genRel(br2, expr.exprs.get(1), istr, isfl));
            dest = VarName.getTmp();
            list.add((new AssignInst(ExprOp.asg, dest, new IntConst(0))).setLabel(isfl));
            list.add((new GotoInst(next)));
            list.add((new AssignInst(ExprOp.asg, dest, new IntConst(1))).setLabel(istr));
        } else {
            list.addAll(gen.genRel(cur, expr.exprs.get(0), br2, istr));
            list.addAll(gen.genRel(br2, expr.exprs.get(1), isfl, istr));
            dest = VarName.getTmp();
            list.add((new AssignInst(ExprOp.asg, dest, new IntConst(1))).setLabel(isfl));
            list.add((new GotoInst(next)));
            list.add((new AssignInst(ExprOp.asg, dest, new IntConst(0))).setLabel(istr));
        }
        return dest;
    }

    public void genIfIR(Label cur, List<MIRInst> list, Label trLa, Label faLa, MIRGen gen, boolean rev) {
        int tag = this.op; //OR = 1 AND = 0
        if (rev) {
            tag = 1 - tag;
        }
        Label br2 = new Label(Label.FALL | Label.DUMMY);
        if (tag == 1) {
            boolean flag = false;
            if (trLa.isFall()) {
                flag = true;
                trLa.st ^= Label.FALL;
            }
            list.addAll(gen.genRel(cur, expr.exprs.get(0), trLa, br2, rev));
            if (flag) {
                trLa.st ^= Label.FALL;
            }
            list.addAll(gen.genRel(br2, expr.exprs.get(1), trLa, faLa, rev));
        } else {
            boolean flag = false;
            if (faLa.isFall()) {
                flag = true;
                faLa.st ^= Label.FALL;
            }
            list.addAll(gen.genRel(cur, expr.exprs.get(0), br2, faLa, rev));
            if (flag) {
                faLa.st ^= Label.FALL;
            }
            list.addAll(gen.genRel(br2, expr.exprs.get(1), trLa, faLa, rev));
        }
    }
}

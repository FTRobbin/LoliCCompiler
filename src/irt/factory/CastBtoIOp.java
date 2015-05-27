package irt.factory;

import ast.nodes.expression.*;
import ast.nodes.expression.CharConst;
import ast.nodes.type.Type;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;
import mir.IntConst;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CastBtoIOp extends Op{

    public CastBtoIOp(Expr expr) {
        this.expr = expr;
        if (expr.exprs.get(0).isConst) {
            int val = (int)(((Character)(expr.exprs.get(0).value)).charValue());
            expr.setValue((Type)(expr.consts.get(0)), true, false, false, val);
        } else {
            expr.setValue((Type) (expr.consts.get(0)), false, false, false, null);
        }
    }

    @Override
    public int interpret(Interpreter v) {
        return v.writeInt(v.newInt(), v.getBit(v.fetchByte(expr.exprs.get(0).accept(v))));
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (ret == null) {
            return null;
        }
        if (expr.exprs.get(0).op instanceof CharOp) {
            if (ret.isAbsTmp()) {
                if (!cur.isDummy()) {
                    list.add((new EmptyInst()).setLabel(cur));
                }
                return new IntConst((int)((Character)expr.exprs.get(0).consts.get(0)).charValue());
            } else {
                return gen.gen(cur, expr.exprs.get(0), list, next, ret);
            }
        }
        VarName dest = ret.isAbsTmp() ? VarName.getTmp() : ret;
        return gen.gen(cur, expr.exprs.get(0), list, next, dest);
    }
}

package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import exception.InterpretError;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class BinIntFact extends OpFactory {

    enum Ops {
        LESS {public int cal(int a, int b){return a < b ? 1 : 0;}},
        GREATER {public int cal(int a, int b){return a > b ? 1 : 0;}},
        LE_OP {public int cal(int a, int b){return a <= b ? 1 : 0;}},
        GE_OP {public int cal(int a, int b){return a >= b ? 1 : 0;}},
        EQ_OP {public int cal(int a, int b){return a == b ? 1 : 0;}},
        NE_OP {public int cal(int a, int b){return a != b ? 1 : 0;}},
        ADD{public int cal(int a, int b){return a + b;}},
        SUB{public int cal(int a, int b){return a - b;}},
        MUL{public int cal(int a, int b){return a * b;}},
        DIV{public int cal(int a, int b){if (b == 0) throw new InterpretError("Divided by zero.\n"); return a / b;}},
        MOD{public int cal(int a, int b){if (b == 0) throw new InterpretError("Divided by zero.\n"); return a % b;}},
        XOR{public int cal(int a, int b){return a ^ b;}},
        OR{public int cal(int a, int b){return a | b;}},
        AND{public int cal(int a, int b){return a & b;}},
        SHL{public int cal(int a, int b){return a << b;}},
        SHR{public int cal(int a, int b){return a >> b;}};

        abstract public int cal(int a, int b);
    }

    Ops op;

    public BinIntFact(Ops op) {
        this.op = op;
    }

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (expr1.retType instanceof CharType || op.ordinal() <= 6 && expr1.retType instanceof PointerType) {
            expr1 = new Expr(IRTBuilder.getExprList(expr1), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        if (expr2.retType instanceof CharType || op.ordinal() <= 6 && expr2.retType instanceof PointerType) {
            expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        expr.exprs.clear();
        expr.exprs.add(expr1);
        expr.exprs.add(expr2);
        if (IRTBuilder.isInt(expr1.retType) && IRTBuilder.isInt(expr2.retType)) {
            return new BinIntOp(expr, op);
        } else {
            throw new SemanticError("Unexpected operator operands type.\n");
        }
    }
}

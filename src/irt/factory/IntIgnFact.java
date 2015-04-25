package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.IntType;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class IntIgnFact extends OpFactory{

    BinIntFact.Ops op;

    public IntIgnFact(BinIntFact.Ops op) {
        this.op = op;
    }

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (!expr1.isLeft) {
            throw new SemanticError("Assignment requires lvalue.");
        }
        if (expr2.retType instanceof CharType) {
            expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        expr.exprs.clear();
        expr.exprs.add(expr1);
        expr.exprs.add(expr2);
        if (IRTBuilder.isInt(expr1.retType) && IRTBuilder.isInt(expr2.retType)) {
            return new BinIntIgnOp(expr, op);
        } else if (IRTBuilder.isInt(expr2.retType) && expr1.retType instanceof CharType) {
            return new BinIntIgnCOp(expr, op);
        } else {
            throw new SemanticError("Unexpected relation operator operands type.\n");
        }
    }
}

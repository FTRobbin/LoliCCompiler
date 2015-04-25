package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class AddIgnFact extends OpFactory{

    static IntIgnFact addIntFact = new IntIgnFact(BinIntFact.Ops.ADD);

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (!expr1.isLeft) {
            throw new SemanticError("lvalue expected.\n");
        }
        if (expr1.retType instanceof PointerType) {
            if (expr2.retType instanceof PointerType) {
                throw new SemanticError("Cannot add two pointers.\n");
            }
            if (!(expr2.retType instanceof IntType)) {
                expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
                expr.exprs.remove(1);
                expr.exprs.add(expr2);
            }
            return new BinPtrlIgnOp(expr, BinIntFact.Ops.ADD);
        } else if (expr2.retType instanceof PointerType) {
            if (expr1.retType instanceof IntType) {
                return new BinPtrrIgnOp(expr, BinIntFact.Ops.ADD);
            } else if (expr1.retType instanceof CharType) {
                return new BinPtrrIgnCOp(expr, BinIntFact.Ops.ADD);
            } else {
                throw new SemanticError("Unexpected operand types.\n");
            }
        } else {
            return addIntFact.createOp(expr);
        }
    }
}

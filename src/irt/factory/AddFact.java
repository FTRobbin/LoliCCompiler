package irt.factory;

import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class AddFact extends OpFactory{

    static BinIntFact addIntFact = new BinIntFact(BinIntFact.Ops.ADD);

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (expr1.retType instanceof PointerType) {
            if (expr2.retType instanceof PointerType) {
                throw new SemanticError("Cannot add two pointers.\n");
            }
            if (!(expr2.retType instanceof IntType)) {
                expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
                expr.exprs.remove(1);
                expr.exprs.add(expr2);
            }
            return new BinPtrlOp(expr, BinIntFact.Ops.ADD);
        } else if (expr2.retType instanceof PointerType) {
            if (!(expr1.retType instanceof IntType)) {
                expr1 = new Expr(IRTBuilder.getExprList(expr1), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
                expr.exprs.pop();
                expr.exprs.push(expr1);
            }
            return new BinPtrrOp(expr, BinIntFact.Ops.ADD);
        } else {
            return addIntFact.createOp(expr);
        }
    }
}

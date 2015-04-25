package irt.factory;

import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import ast.nodes.type.Type;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class SubFact extends OpFactory{

    static BinIntFact subIntFact = new BinIntFact(BinIntFact.Ops.SUB);

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (expr1.retType instanceof PointerType && expr2.retType instanceof PointerType) {
            Type base1 = ((PointerType)expr1.retType).baseType;
            Type base2 = ((PointerType)expr2.retType).baseType;
            if (!IRTBuilder.typeEqual(base1, base2)) {
                throw new SemanticError("Cannot sub two pointers of different types.\n");
            }
            return new SubPtrOp(expr, base1.size);
        } else if (expr1.retType instanceof PointerType) {
            if (!(expr2.retType instanceof IntType)) {
                expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
                expr.exprs.remove(1);
                expr.exprs.add(expr2);
            }
            return new BinPtrlOp(expr, BinIntFact.Ops.SUB);
        } else if (expr2.retType instanceof PointerType) {
            if (!(expr1.retType instanceof IntType)) {
                expr1 = new Expr(IRTBuilder.getExprList(expr1), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
                expr.exprs.pop();
                expr.exprs.push(expr1);
            }
            return new BinPtrrOp(expr, BinIntFact.Ops.SUB);
        } else {
            return subIntFact.createOp(expr);
        }
    }
}

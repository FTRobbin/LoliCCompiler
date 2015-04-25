package irt.factory;

import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class AssignFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (!expr1.isLeft) {
            throw new SemanticError("Assignment requires lvalue.\n");
        }
        if (!IRTBuilder.typeEqual(expr1.retType, expr2.retType)) {
            expr.exprs.remove(1);
            expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(expr1.retType), Factories.CAST.getFact());
            expr.exprs.add(expr2);
        }
        return new AssignOp(expr, expr1.retSize);
    }
}

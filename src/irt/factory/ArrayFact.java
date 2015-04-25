package irt.factory;

import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class ArrayFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        Expr delta = expr.exprs.get(1);
        Expr addr = expr.exprs.get(0);
        if (!(addr.retType instanceof PointerType)) {
            throw new SemanticError("The [] operator must be used on a pointer type.\n");
        }
        if (!IRTBuilder.isInt(delta.retType)) {
            delta = new Expr(IRTBuilder.getExprList(delta), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
            expr.exprs.pop();
            expr.exprs.push(delta);
        }
        return new ArrayOp(expr);
    }
}

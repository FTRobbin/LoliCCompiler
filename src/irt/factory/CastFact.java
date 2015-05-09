package irt.factory;

import ast.nodes.type.*;
import exception.SemanticError;
import io.netty.util.internal.chmv8.ConcurrentHashMapV8;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class CastFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0);
        Type type = (Type)(expr.consts.get(0));
        if (expr1.retType instanceof FunctionType && type instanceof PointerType && ((PointerType) type).baseType instanceof FunctionType) {
            expr1 = new Expr(IRTBuilder.getExprList(expr1), null, Factories.UNADR.getFact());
            expr.exprs.pop();
            expr.exprs.push(expr1);
        }
        if (IRTBuilder.typeEqual(expr1.retType, type)) {
            return new CastNoOp(expr);
        }
        if (IRTBuilder.getRank(expr1.retType) == 4 && IRTBuilder.getRank(type) == 4) {
            return new CastNoOp(expr) ;
        }
        if (IRTBuilder.isInt(expr1.retType) && type instanceof CharType) {
            return new CastItoBOp(expr) ;
        }
        if (expr1.retType instanceof CharType && type instanceof IntType) {
            return new CastBtoIOp(expr) ;
        }
        throw new SemanticError("Type cast error.\n");
    }
}

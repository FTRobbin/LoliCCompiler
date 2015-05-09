package irt.factory;

import ast.nodes.type.*;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class CallFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        Type type = expr.exprs.get(0).retType;
        if (type instanceof PointerType && ((PointerType)type).baseType instanceof FunctionType) {
            Expr expr1 = new Expr(IRTBuilder.getExprList(expr.exprs.get(0)), null, Factories.UNREF.getFact());
            expr.exprs.pop();
            expr.exprs.push(expr1);
            type = expr.exprs.get(0).retType;
        }
        if (!(type instanceof FunctionType)) {
            throw new SemanticError("Requires a function expression to call.\n");
        }
        List<Type> list = ((FunctionType)type).paraType;
        LinkedList<Expr> ret = new LinkedList<Expr>();
        ret.add(expr.exprs.get(0));
        int i = 0, j = 1;
        while (i < list.size() || j < expr.exprs.size()) {
            if (i == list.size()) {
                throw new SemanticError("Function call pattern does not match.\n");
            }
            if (j == expr.exprs.size() && !(list.get(i) instanceof ELLIPSIS)) {
                throw new SemanticError("Function call pattern does not match.\n");
            }
            if (list.get(i) instanceof ELLIPSIS) {
                if (j < expr.exprs.size()) {
                    if (expr.exprs.get(j).retSize == 4) {
                        ret.add(expr.exprs.get(j));
                    } else {
                        ret.add(new Expr(IRTBuilder.getExprList(expr.exprs.get(j)), IRTBuilder.getList(new IntType()), Factories.CAST.getFact()));
                    }
                    ++j;
                } else {
                    ++i;
                }
            } else if (IRTBuilder.typeEqual(list.get(i), expr.exprs.get(j).retType)) {
                ret.add(expr.exprs.get(j));
                ++i;
                ++j;
            } else {
                ret.add(new Expr(IRTBuilder.getExprList(expr.exprs.get(j)), IRTBuilder.getList(list.get(i)), Factories.CAST.getFact()));
                ++i;
                ++j;
            }
        }
        expr.exprs = ret;
        return new CallOp(expr);
    }
}

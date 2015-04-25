package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.IntType;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class SPRelFact extends OpFactory {

    public static int OR = 1, AND = 0;

    int op;

    public SPRelFact(int op) {
        this.op = op;
    }

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (expr1.retType instanceof CharType) {
            expr1 = new Expr(IRTBuilder.getExprList(expr1), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        if (expr2.retType instanceof CharType) {
            expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        expr.exprs.clear();
        expr.exprs.add(expr1);
        expr.exprs.add(expr2);
        if (IRTBuilder.getRank(expr1.retType) == 4 && IRTBuilder.getRank(expr2.retType) == 4) {
            return new SPRelOp(expr, op);
        } else {
            throw new SemanticError("Unexpected ||/&& operands type.\n");
        }
    }
}

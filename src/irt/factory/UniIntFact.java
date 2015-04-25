package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import ast.nodes.type.Type;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class UniIntFact extends OpFactory {

    enum Ops {
        ADD {public int cal(int a) {return a;}},
        SUB {public int cal(int a) {return -a;}},
        NOT {public int cal(int a) {return a == 0 ? 1 : 0;}},
        TILDE {public int cal(int a) {return ~a;}};

        abstract public int cal(int a);
    }

    Ops op;

    public UniIntFact(Ops op) {
        this.op = op;
    }

    @Override
    public Op createOp(Expr expr) {
        Type type = expr.exprs.get(0).retType;
        if (type instanceof CharType) {
            Expr expr1 = expr.exprs.pop();
            expr1 = new Expr(IRTBuilder.getExprList(expr1), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
            expr.exprs.push(expr1);
        }
        if (type instanceof IntType || op.name() == "NOT" && type instanceof PointerType) {
            return new UniIntOp(expr, op);
        } else {
            throw new SemanticError("Unexpected unary expression oprand type.\n");
        }
    }
}

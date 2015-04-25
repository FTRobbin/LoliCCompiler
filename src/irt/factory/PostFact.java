package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.PointerType;
import ast.nodes.type.Type;
import exception.SemanticError;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class PostFact extends OpFactory {

    int op;

    public PostFact(int op) {
        this.op = op;
    }

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0);
        if (!expr1.isLeft) {
            throw new SemanticError("The ++/-- post expression requires a lvalue.\n");
        }
        Type type = expr.exprs.get(0).retType;
        int delta = 1;
        if (type instanceof PointerType) {
            delta = ((PointerType)type).baseType.size;
        }
        if (type instanceof CharType) {
            return new PostByteOp(expr, op, delta);
        } else {
            return new PostIntOp(expr, op, delta);
        }
    }
}

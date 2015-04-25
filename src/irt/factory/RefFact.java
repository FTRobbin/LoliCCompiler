package irt.factory;

import ast.nodes.type.PointerType;
import ast.nodes.type.Type;
import exception.SemanticError;
import irt.Expr;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class RefFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        Type type = expr.exprs.get(0).retType;
        if (!(type instanceof PointerType)) {
            throw new SemanticError("Pointer type expected by *.\n");
        }
        Type base = ((PointerType)type).baseType;
        if (IRTBuilder.isVoid(base)) {
            throw new SemanticError("Void pointer cannot be dereferenced.\n");
        }
        return new RefOp(expr, base);
    }
}

package irt.factory;

import exception.SemanticError;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class AdrFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        if (!expr.exprs.get(0).isLeft) {
            throw new SemanticError("lvalue expected by &.\n");
        }
        return new AdrOp(expr);
    }
}

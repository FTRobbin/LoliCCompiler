package irt.factory;

import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class EmptyFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        return new EmptyOp(expr);
    }
}

package irt.factory;

import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public abstract class OpFactory {
    public abstract Op createOp(Expr expr);
}

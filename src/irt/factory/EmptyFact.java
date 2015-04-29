package irt.factory;

import irt.Expr;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class EmptyFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        expr.consts = new LinkedList<Object>();
        expr.consts.add(1);
        return new IntOp(expr);
    }
}

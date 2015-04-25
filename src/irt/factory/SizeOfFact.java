package irt.factory;

import irt.Expr;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class SizeOfFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        expr.consts = new LinkedList<Object>();
        expr.consts.add(expr.exprs.get(0).retSize);
        return new IntOp(expr);
    }
}

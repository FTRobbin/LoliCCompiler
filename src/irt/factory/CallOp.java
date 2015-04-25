package irt.factory;

import ast.nodes.type.FunctionType;
import interpreter.Interpreter;
import irt.Expr;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CallOp extends Op {

    public CallOp(Expr expr) {
        this.expr = expr;
        expr.setValue(((FunctionType)(expr.exprs.get(0).retType)).returnType, false, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int func = v.fetchInt(expr.exprs.get(0).accept(v));
        LinkedList<Integer> addrs = new LinkedList<Integer>();
        LinkedList<Integer> size = new LinkedList<Integer>();
        addrs.add(0);
        size.add(expr.retSize);
        for (int i = 1; i < (int)expr.exprs.size(); ++i) {
            addrs.add(expr.exprs.get(i).accept(v));
            size.add(expr.exprs.get(i).retSize);
        }
        int head = v.getTop();
        for (int i = 0; i < addrs.size(); ++i) {
            int tmp = v.getTop();
            for (int j = 0; j < size.get(i); ++j) {
                v.newByte();
            }
            if (i > 0) {
                for (int j = 0; j < size.get(i); ++j) {
                    v.writeByte(tmp + j, v.fetchByte(addrs.get(i) + j));
                }
            }
        }
        return v.callFunc(func, head);
    }
}

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
        int head = v.getTop();
        v.newStack(expr.retSize);
        for (int i = 1; i < expr.exprs.size(); ++i) {
            v.newStack(expr.exprs.get(i).retSize);
        }
        int tmp = head + expr.retSize;
        for (int i = 1; i < expr.exprs.size(); ++i) {
            int size = expr.exprs.get(i).retSize;
            int addr = (expr.exprs.get(i).accept(v));
            v.copyMem(addr, size, tmp);
            //System.out.println("CallOp! " + func + " : " + addr + "  " + size + "  " + tmp + "  " + v.fetchInt(tmp) + "\n");
            tmp += size;
        }
        return v.callFunc(func, head);
    }
}

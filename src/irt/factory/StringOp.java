package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.PointerType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class StringOp extends Op{

    int addr = 0;

    public StringOp(Expr expr) {
        this.expr = expr;
        expr.setValue(new PointerType(new CharType()), false, false, true, null);
    }

    @Override
    public int interpret(Interpreter v) {
        if (addr == 0) {
            String s = (String)expr.consts.get(0);
            addr = v.locate(s.length() + 1);
            for (int i = 0; i < s.length(); ++i) {
                v.writeByte(addr + i, (byte)(s.charAt(i)));
            }
            v.writeByte(addr + s.length(), (byte)0);
        }
        return v.writeInt(v.newInt(), addr);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen, VarName ret) {
        if (!cur.isDummy() && (ret == null || ret.isAbsTmp())) {
            list.add((new EmptyInst()).setLabel(cur));
        }
        if (ret == null) {
            return null;
        } else if (ret.isAbsTmp()) {
            return new StringConst((String) this.expr.consts.get(0));
        } else {
            list.add(new AssignInst(ExprOp.asg, ret, new StringConst((String) this.expr.consts.get(0))).setLabel(cur));
            return ret;
        }
    }
}

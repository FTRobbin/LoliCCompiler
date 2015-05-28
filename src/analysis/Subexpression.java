package analysis;

import ast.nodes.expression.Symbol;
import mir.ExprOp;
import mir.Value;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class Subexpression {

    public Value val1, val2;
    public ExprOp op;
    public int id;

    public static HashMap<Integer, Subexpression> dict;

    public static void reset() {
        if (dict != null) {
            dict.clear();
        } else {
            dict = new HashMap<>();
        }
    }

    Subexpression(ExprOp op, Value val1, Value val2, int id) {
        this.op = op;
        this.val1 = val1;
        this.val2 = val2;
        this.id = id;
        dict.put(id, this);
    }

    public static Subexpression getSubexp(ExprOp op, Value val1, Value val2) {
        int tmp = Symbol.getnum("SUBEXP"  + op.name() + val1.name + val2.name);
        if (dict.containsKey(tmp)) {
            return dict.get(tmp);
        } else {
            return new Subexpression(op, val1, val2, tmp);
        }
    }

    public String print() {
        return "SUBEXP" + val1.name + op.name() + val2.name;
    }
}

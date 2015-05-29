package analysis;

import ast.nodes.expression.Symbol;
import mir.VarName;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/29.
 */
public class AssignCopyPair {

    public VarName u, v;

    int id;

    static HashMap<Integer, AssignCopyPair> dict = new HashMap<>();

    public static void reset() {
        dict = new HashMap<>();
    }

    AssignCopyPair(VarName u, VarName v, int id) {
        this.u = u;
        this.v = v;
        this.id = id;
    }

    static public AssignCopyPair getACP(VarName u, VarName v) {
        int id = Symbol.getnum(u.name + "=" + v.name);
        if (!dict.containsKey(id)) {
            dict.put(id, new AssignCopyPair(u, v, id));
        }
        return dict.get(id);
    }
}

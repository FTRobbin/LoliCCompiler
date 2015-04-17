package ast.nodes.expression;

import ast.nodes.Visible;
import ast.visitors.Visitor;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class Symbol implements Visible {
    static int count = 0;

    static HashMap<String, Integer> dict = new HashMap<String, Integer>();

    static public void reset() {
        count = 0;
        dict.clear();
    }

    private String name;
    private boolean anonymous;

    public int num;

    public Symbol(String name) {
        this.name = name;
        anonymous = name.length() > 0;
        if (anonymous) {
            num = count++;
        } else {
            if (dict.containsKey(name.intern())) {
                num = dict.get(name.intern());
            } else {
                num = count++;
                dict.put(name.intern(), num);
            }
        }
    }

    @Override
    public String toString() {
        return name;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

package table;

import parser.Symbols;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

/**
 * Created by Robbin Ni on 2015/4/15.
 */

public class SyntacticTable {

    static final int IDENTIFIER = Symbols.IDENTIFIER, TYPENAME = Symbols.TYPENAME;

    public LinkedList<HashMap<String, Integer>> list;

    public HashMap<String, Integer> lastPop;

    private void traverse() {
        for (int i = 0; i < list.size(); ++i) {
            System.out.println("Level : " + i + " / " + list.size());
            for (Map.Entry entry : list.get(i).entrySet()) {
                System.out.println(entry.getKey() + " = " + entry.getValue());
            }
        }
    }

    public SyntacticTable() {
        list = new LinkedList<HashMap<String, Integer>>();
        lastPop = null;
        addScope();
    }

    public void addScope() {
        list.push(new HashMap<String, Integer>());
        traverse();
    }

    public void delScope() {
        lastPop = list.peek();
        list.pop();
    }

    public void retrive() {
        list.push(lastPop);
    }

    public void addEntry(String name, int type) {
        (list.peek()).put(name.intern(), type);
    }

    public int typeOf(String name) {
        for (int i = 0; i < list.size(); ++i) {
            if (list.get(i).containsKey(name.intern())) {
                return list.get(i).get(name.intern());
            }
        }
        return IDENTIFIER;
    }
}

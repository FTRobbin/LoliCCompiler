package semantic;

import ast.nodes.type.Type;

import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/17.
 */

public class VariableTable {

    static int VARIABLE = 0;
    static int TYPENAME = 1;

    private LinkedList<HashMap<Integer, Type>> list;
    private LinkedList<HashMap<Integer, Integer>> type;

    public VariableTable() {
        list = new LinkedList<HashMap<Integer, Type>>();
        type = new LinkedList<HashMap<Integer, Integer>>();
        addScope();
    }

    public void addScope() {
        list.push(new HashMap<Integer, Type>());
        type.push(new HashMap<Integer, Integer>());
    }

    public void delScope() {
        list.pop();
        type.pop();
    }

    public boolean checkCurId(Integer id) {
        return list.peek().containsKey(id);
    }

    public boolean checkId(Integer id) {
        for (HashMap<Integer, Type> map : list) {
            if (map.containsKey(id)) {
                return true;
            }
        }
        return false;
    }

    public Integer checkType(Integer id) {
        for (HashMap<Integer, Integer> map : type) {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        return null;
    }

    public void addVari(Integer id, Type type) {
        list.peek().put(id, type);
        this.type.peek().put(id, VARIABLE);
    }

    public void addType(Integer id, Type type) {
        list.peek().put(id, type);
        this.type.peek().put(id, TYPENAME);
    }

    public Type getId(Integer id) {
        for (HashMap<Integer, Type> map : list) {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        return null;
    }
}

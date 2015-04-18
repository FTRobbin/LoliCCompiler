package semantic;

import ast.nodes.type.Type;

import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class StructureTable {

    private LinkedList<HashMap<Integer, Type>> list;

    public StructureTable() {
        list = new LinkedList<HashMap<Integer, Type>>();
        addScope();
    }

    public void addScope() {
        list.push(new HashMap<Integer, Type>());
    }

    public void delScope() {
        list.pop();
    }

    public boolean checkCurId(Integer id) {
        return list.peek().containsKey(id);
    }

    public void addEntry(Integer id, Type type) {
        list.peek().put(id, type);
    }

    public boolean checkId(Integer id) {
        for (HashMap<Integer, Type> map : list) {
            if (map.containsKey(id)) {
                return true;
            }
        }
        return false;
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

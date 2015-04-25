package semantic;

import ast.nodes.type.Type;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class MemberTable {
    private HashMap<Integer, Type> map;
    private HashMap<Integer, Integer> devi;

    MemberTable() {
        map = new HashMap<Integer, Type>();
        devi = new HashMap<Integer, Integer>();
    }

    public void addEntry(Integer id, Type type, Integer delta)  {
        map.put(id, type);
        devi.put(id, delta);
    }

    public boolean checkId(Integer id) {
        return map.containsKey(id);
    }

    public Type getId(Integer id) {
        return map.get(id);
    }

    public int getDel(Integer id) {
        return devi.get(id);
    }
}

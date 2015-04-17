package semantic;

import ast.nodes.type.Type;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class MemberTable {
    private HashMap<Integer, Type> map;

    MemberTable() {
        map = new HashMap<Integer, Type>();
    }

    public void addEntry(Integer id, Type type)  {
        map.put(id, type);
    }

    public boolean checkId(Integer id) {
        return map.containsKey(id);
    }

    public Type getId(Integer id) {
        return map.get(id);
    }
}

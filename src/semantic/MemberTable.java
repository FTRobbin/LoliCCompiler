package semantic;

import ast.nodes.type.*;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class MemberTable {
    private HashMap<Integer, Type> map;
    private HashMap<Integer, Integer> devi;
    public int maxAlign;

    MemberTable() {
        map = new HashMap<Integer, Type>();
        devi = new HashMap<Integer, Integer>();
        maxAlign = 0;
    }

    public void addEntry(Integer id, Type type, Integer delta)  {
        map.put(id, type);
        devi.put(id, delta);
        maxAlign = Math.max(maxAlign, IRTBuilder.getAlignSize(type));
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

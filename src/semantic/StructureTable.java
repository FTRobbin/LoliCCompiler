package semantic;

import ast.nodes.type.Type;

import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class StructureTable {

    public static int STRUCT = 1, UNION = 2;

    private LinkedList<HashMap<Integer, Type>> list;
    private LinkedList<HashMap<Integer, Integer>> type;

    public StructureTable() {
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

    public void addEntry(Integer id, Type type, int soru) {
        list.peek().put(id, type);
        this.type.peek().put(id, soru);
    }

    public int checkId(Integer id) {
        for (HashMap<Integer, Integer> map : type) {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        return 0;
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

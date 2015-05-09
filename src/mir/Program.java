package mir;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class Program {

    public LinkedList<ProgUnit> list;

    public Program() {
        list = new LinkedList<>();
    }

    public void addUnit(ProgUnit unit) {
        list.add(unit);
    }

    public List<String> print() {
        LinkedList<String> ret = new LinkedList<>();
        ret.add("\\\\Program");
        for (ProgUnit unit : list) {
            ret.addAll(unit.print());
        }
        return ret;
    }
}

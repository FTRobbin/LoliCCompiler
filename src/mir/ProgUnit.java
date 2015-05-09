package mir;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class ProgUnit {

    public Label label;
    public LinkedList<MIRInst> list;

    public ProgUnit() {
        label = null;
        list = new LinkedList<>();
    }

    public ProgUnit(Label label) {
        this.label = label;
        list = new LinkedList<>();
    }

    public void addInst(MIRInst inst) {
        list.add(inst);
    }

    public void addInst(List<MIRInst> insts) {
        list.addAll(insts);
    }

    public List<String> print() {
        LinkedList<String> ret = new LinkedList<>();
        ret.add(label.name + ":");
        ret.add("begin");
        for (MIRInst inst : list)  {
            ret.add(inst.print());
        }
        ret.add("end");
        return ret;
    }
}

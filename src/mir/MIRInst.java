package mir;

import analysis.cfg.Block;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public abstract class MIRInst {
    public Label label;
    public String comment;

    public MIRInst setLabel(Label label) {
        this.label = label;
        return this;
    }

    public MIRInst setComment(String comment) {
        this.comment = comment;
        return this;
    }

    public List<String> print() {
        LinkedList<String> ret = new LinkedList<>();
        ret.add("");
        return ret;
    }

    public List<String> print(String s) {
        LinkedList<String> ret = new LinkedList<>();
        if (label != null && !label.isDummy()) {
            s = label.name + ": " + s;
        }
        ret.add(s);
        return ret;
    }

    public boolean isLeader = false;
    public Block block;
}

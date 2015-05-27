package gen.spim;

import gen.ASMCode;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMCode extends ASMCode {

    public List<String> data;

    public List<SPIMInst> text;

    public SPIMCode() {
        data = new LinkedList<>();
        text = new LinkedList<>();
    }

    public void addData(String inst) {
        data.add(inst);
    }

    public void addText(SPIMInst inst) {
        text.add(inst);
    }

    @Override
    public String print() {
        String ret = ".data\n";
        for (String s : data) {
            ret += s + "\n";
        }
        ret += ".text\n";
        for (SPIMInst inst : text) {
            ret += inst.print() + "\n";
        }
        return ret;
    }

    public SPIMLabel getLabel(String name) {
        for (SPIMInst inst : text) {
            if (inst.label != null) {
                continue;
            }
            if (inst.op.use >= 1 && inst.val0 instanceof SPIMAddress && ((SPIMAddress) inst.val0).label != null && ((SPIMAddress) inst.val0).label.label.equals(name)) {
                return ((SPIMAddress) inst.val0).label;
            }
            if (inst.op.use >= 2 && inst.val1 instanceof SPIMAddress && ((SPIMAddress) inst.val1).label != null && ((SPIMAddress) inst.val1).label.label.equals(name)) {
                return ((SPIMAddress) inst.val1).label;
            }
            if (inst.op.use >= 3 && inst.val2 instanceof SPIMAddress && ((SPIMAddress) inst.val2).label != null && ((SPIMAddress) inst.val2).label.label.equals(name)) {
                return ((SPIMAddress) inst.val2).label;
            }
        }
        return null;
    }
}

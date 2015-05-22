package gen;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/19.
 */
public class SPIMCode extends ASMCode {

    public List<String> data;

    public List<String> text;

    public SPIMCode() {
        data = new LinkedList<>();
        data.add("\t.data");
        text = new LinkedList<>();
        text.add("\t.text");
        text.add("\t.globl main");
    }

    public void addData(String inst) {
        data.add(inst);
    }

    public void addText(String inst) {
        text.add(inst);
    }

    @Override
    public String print() {
        String ret = "";
        for (String s : data) {
            ret += s + "\n";
        }
        for (String s : text) {
            ret += s + "\n";
        }
        return ret;
    }
}

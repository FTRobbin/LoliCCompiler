package mir;

import analysis.cfg.Block;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/10.
 */
public class PhiInst extends MIRInst {

    public VarName dest;
    public HashMap<VarName, Block> set;

    public PhiInst(VarName dest) {
        this.dest = dest;
        set = new HashMap<>();
    }

    public void addVar(VarName var, Block b) {
        set.put(var, b);
    }

    @Override
    public List<String> print() {
        String s = dest.name + " = phi(";
        int cnt = 0;
        for (VarName var : set.keySet()) {
            if (cnt != 0) {
                s += ", ";
            }
            s += var.name;
            ++cnt;
        }
        s += ")";
        return super.print(s);
    }
}

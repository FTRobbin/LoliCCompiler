package mir;

import java.util.HashSet;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/10.
 */
public class PhiInst extends MIRInst {

    public VarName dest;
    public HashSet<VarName> set;

    public PhiInst(VarName dest) {
        this.dest = dest;
        set = new HashSet<>();
    }

    public void addVar(VarName var) {
        set.add(var);
    }

    @Override
    public List<String> print() {
        String s = dest.name + " = phi(";
        int cnt = 0;
        for (VarName var : set) {
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

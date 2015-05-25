package gen.advanced;

import mir.VarName;

import java.util.HashSet;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class RegisterStatus {
    public HashSet<VarName> vars;

    public RegisterStatus() {
        vars = new HashSet<>();
    }

    public void addVar(VarName var) {
        vars.add(var);
    }

    public void delVar(VarName var) {
        vars.remove(var);
    }
}

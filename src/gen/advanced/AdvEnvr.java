package gen.advanced;

import gen.spim.SPIMRegister;
import mir.VarName;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class AdvEnvr {

    public int cnt = 0;

    public HashMap<VarName, SPIMRegister> bond;

    public AdvEnvr() {
        bond = new HashMap<>();
    }
}

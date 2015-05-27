package gen.spim;

import java.util.HashMap;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMImmediate extends SPIMValue {
    public Integer val;

    static HashMap<Integer, SPIMImmediate> dict = new HashMap<>();

    SPIMImmediate(int val) {
        this.val = val;
    }

    public static SPIMImmediate getImmi(int val) {
        if (!dict.containsKey(val)) {
            SPIMImmediate ret = new SPIMImmediate(val);
            dict.put(val, ret);
        }
        return dict.get(val);
    }

    @Override
    public String print() {
        return "" + val;
    }
}

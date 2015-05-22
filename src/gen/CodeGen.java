package gen;

import mir.Program;

/**
 * Created by Robbin Ni on 2015/5/19.
 */
public interface CodeGen {
    public ASMCode gen (Program prog);
}

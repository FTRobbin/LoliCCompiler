package gen.spim;

import gen.spim.spimcfg.Block;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMLabel {
    public String label;

    public SPIMLabel (String label) {
        this.label = label;
        this.block = null;
    }

    public Block block;
}

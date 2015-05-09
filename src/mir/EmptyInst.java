package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/9.
 */
public class EmptyInst extends MIRInst {

    @Override
    public List<String> print() {
        return super.print("");
    }
}

package mir;

import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class ReturnInst extends MIRInst {

    @Override
    public List<String> print() {
        return super.print("return");
    }
}

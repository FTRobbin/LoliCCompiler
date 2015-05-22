package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class IntConst extends Const {

    public int val;

    public IntConst(Integer val) {
        this.val = val;
        this.name = "" + val;
        this.size = 4;
        this.align = 4;
    }
}

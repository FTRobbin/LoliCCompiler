package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class VarName extends Value {

    static int tmpCnt = 0;

    public static void reset() {
        tmpCnt = 0;
    }

    public boolean isTemp;
    public int uid;

    public VarName(Integer uid, String name) {
        this.isTemp = false;
        this.uid = uid;
        if (uid > 0) {
            this.name = name + "#" + uid;
        } else {
            this.name = name;
        }
    }

    public VarName() {
        this.isTemp = true;
        this.name = "#t" + (tmpCnt++);
    }
}

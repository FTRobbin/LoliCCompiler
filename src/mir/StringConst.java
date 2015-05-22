package mir;

/**
 * Created by Robbin Ni on 2015/5/9.
 */
public class StringConst extends Const {
    public String s;

    public StringConst(String s) {
        this.s = s;
        this.name = "\"" + s + "\"";
        this.size = 4;
        this.align = 4;
    }
}

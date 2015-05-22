package mir;

/**
 * Created by Robbin Ni on 2015/5/9.
 */
public class CharConst extends Const {
    public char ch;

    public CharConst(Character ch) {
        this.ch = ch;
        this.name = "\'" + ch + "\'";
        this.size = 1;
        this.align = 1;
    }
}

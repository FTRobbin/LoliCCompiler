package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */

//TODO

public class Label {

    public final static int FALL = 1, DUMMY = 2, USED = 4;

    private static int cnt = 0;

    public static void reset() {
        cnt = 0;
    }

    public String name;
    public int id, st = 0;

    public MIRInst inst = null;

    public Label() {
        id = cnt++;
        name = "_L" + id;
    }

    public Label(String s) {
        name = s;
        id = cnt++;
    }

    public Label(int num) {
        name = "";
        st = num;
    }

    public void reInit() {
        if (isDummy()) {
            st ^= DUMMY;
        }
        id = cnt++;
        name = "_L" + id;
    }

    public boolean isFall() {
        return (st & FALL) != 0;
    }

    public boolean isDummy() {
        return (st & DUMMY) != 0;
    }

    public boolean used() {
        return (st & USED) != 0;
    }

}

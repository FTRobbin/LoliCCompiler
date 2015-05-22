package gen.basic;

/**
 * Created by Robbin Ni on 2015/5/19.
 */
public enum BasicReg {
    t0,
    t1,
    t2,
    t3,
    t4,
    t5,
    t6,
    t7,
    t8,
    t9,
    v0;


    @Override
    public String toString() {
        return "$" + this.name();
    }
}

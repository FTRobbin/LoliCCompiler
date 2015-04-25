package irt;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class JpSt extends Stat implements IRTNode {

    public final static int NONE = 0, CONTINUE = 1, BREAK = 2, RETURN = 3;

    public int cont;

    public JpSt(int cont) {
        this.cont = cont;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

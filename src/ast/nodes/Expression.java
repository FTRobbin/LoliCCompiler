package ast.nodes;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public abstract class Expression implements Visible {
    public boolean isEmpty() {
        return false;
    }

    public abstract int getPrecedence();
}

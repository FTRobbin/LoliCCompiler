package ast.nodes.type;

import ast.nodes.Visible;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public abstract class Type implements Visible {

    public boolean isLeft = false;
    public boolean isConst = false;
    public Object value = null;
    public Integer size = 0;

    public Type encore(Type t) {
        return this;
    }

    public Type getShell() {
        return null;
    }

    public abstract Type clone();
}

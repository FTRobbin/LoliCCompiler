package ast.nodes.type;

import ast.nodes.Visible;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public abstract class Type implements Visible {
    public Type encore(Type t) {
        return this;
    }

    public boolean hasDefi() {
        return false;
    }

    public Type cutDefi() {
        return this;
    }

    abstract public Type getShell();
}

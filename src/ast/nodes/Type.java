package ast.nodes;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

public abstract class Type implements Visible {
    public Type encore(Type t) {
        return this;
    }

    abstract public Type getShell();
}

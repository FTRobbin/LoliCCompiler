package ast.nodes;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public abstract class Declaration implements Visible {
    public Type type = null;
    public Symbol name = null;
    public Initializer init = null;
}

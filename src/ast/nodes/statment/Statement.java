package ast.nodes.statment;

import ast.nodes.Visible;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public abstract class Statement implements Visible {
    public boolean isEmpty() {
        return false;
    }
}

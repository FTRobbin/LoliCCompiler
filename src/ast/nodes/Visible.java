package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public interface Visible {
    public void accept(Visitor v);
}

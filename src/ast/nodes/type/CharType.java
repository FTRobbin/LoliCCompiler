package ast.nodes.type;

import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class CharType extends Type implements Visible {

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

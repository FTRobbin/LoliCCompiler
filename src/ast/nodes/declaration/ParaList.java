package ast.nodes.declaration;

import ast.nodes.Visible;
import ast.nodes.declaration.DeclList;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/11.
 */
public class ParaList extends DeclList implements Visible {

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

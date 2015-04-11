package ast.nodes;

import ast.visitors.Visitor;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/11.
 */
public class ParaList extends DeclList implements Visible {

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

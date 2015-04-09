package ast.nodes;

import ast.visitors.Visitor;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class StatList implements Visiable {

    public List<Statement>  list;

    public StatList() {
        list = new LinkedList<Statement>();
    }

    public StatList add(Statement stat) {
        list.add(stat);
        return this;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

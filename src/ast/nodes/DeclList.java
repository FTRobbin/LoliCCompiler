package ast.nodes;

import ast.visitors.Visitor;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class DeclList implements Visiable{

    public List<Declaration> list;

    public DeclList() {
        list = new LinkedList<Declaration>();
    }

    public DeclList add(Declaration decl) {
        list.add(decl);
        return this;
    }

    public DeclList add(DeclList dl2) {
        list.addAll(dl2.list);
        return this;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

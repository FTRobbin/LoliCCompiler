package ast.nodes;

import ast.visitors.Visitor;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class InitList extends Initializer implements Visiable {

    public List<Initializer> list;

    public InitList() {
        list = new LinkedList<Initializer>();
    }

    public InitList add(Initializer init) {
        if (init != null) {
            list.add(init);
        }
        return this;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}
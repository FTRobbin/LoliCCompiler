package ast.nodes;

import ast.visitors.Visitor;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public class Program implements Visible {

    public List<Declaration> list;

    public Program() {
        list = new LinkedList<Declaration>();
    }

    public Program add(Declaration decl) {
        list.add(decl);
        return this;
    }

    public Program add(DeclList decls) {
        list.addAll(decls.list);
        return this;
    }

    public Program add(Program prog2) {
        list.addAll(prog2.list);
        return this;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

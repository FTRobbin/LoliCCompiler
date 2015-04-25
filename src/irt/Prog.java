package irt;

import ast.nodes.expression.Symbol;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Prog implements IRTNode {

    public LinkedList<Func> funcs;
    public LinkedList<Decl> decls;
    public Func main;

    public void add(IRTNode node) {
        if (node instanceof Func) {
            funcs.add((Func)node);
            if (((Func)node).id == Symbol.getnum("main")) {
                main = (Func)node;
            }
        } else if (node instanceof Decl) {
            decls.add((Decl)node);
        } else {
            throw new InternalError("Unexpected IRTNode in Prog.add().\n");
        }
    }

    public Prog(LinkedList<IRTNode> list) {
        funcs = new LinkedList<Func>();
        decls = new LinkedList<Decl>();
        main = null;
        while (list.size() > 0) {
            add(list.pop());
        }
    }


    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

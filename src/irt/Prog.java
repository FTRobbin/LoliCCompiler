package irt;

import ast.nodes.expression.Symbol;

import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Prog implements IRTNode {

    public HashMap<Integer, Func> funcs;
    public LinkedList<Decl> decls;

    public void add(IRTNode node) {
        if (node instanceof Func) {
            funcs.put(((Func)node).id, (Func)node);
        } else if (node instanceof Decl) {
            decls.add((Decl)node);
        } else {
            System.out.print(node.toString());
            throw new InternalError("Unexpected IRTNode in Prog.add().\n");
        }
    }

    public Prog(LinkedList<IRTNode> list) {
        funcs = new HashMap<Integer, Func>();
        decls = new LinkedList<Decl>();
        while (list.size() > 0) {
            add(list.pop());
        }
    }


    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

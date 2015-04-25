package irt;

import ast.nodes.declaration.DeclList;
import ast.nodes.declaration.Declaration;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Func implements IRTNode {

    public int id;
    public int retSize;
    public LinkedList<Integer> paraPos, paraName;
    public CpSt st;

    public Func(int id, int retSize, DeclList paras, CpSt st) {
        this.id = id;
        this.retSize = retSize;
        int pos = 0;
        for (Declaration decl : paras.list)  {
            paraPos.add(pos);
            paraName.add(decl.name.num);
            pos += decl.type.size;
        }
        this.st = st;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

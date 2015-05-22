package irt;

import ast.nodes.declaration.DeclList;
import ast.nodes.declaration.Declaration;
import ast.nodes.type.RecordType;
import semantic.IRTBuilder;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Func implements IRTNode {

    public int id;
    public int retSize, retAlign;
    public boolean retRe;
    public LinkedList<Integer> paraPos, paraName, paraSize, paraAlign;
    public LinkedList<Boolean> paraRe;
    public CpSt st;


    public Func(int id, int retSize, int retAlign, boolean retRe, DeclList paras, CpSt st) {
        this.id = id;
        this.retSize = retSize;
        this.retAlign = retAlign;
        this.retRe = retRe;
        int pos = 0;
        paraPos = new LinkedList<Integer>();
        paraName = new LinkedList<Integer>();
        paraSize = new LinkedList<Integer>();
        paraRe = new LinkedList<>();
        paraAlign = new LinkedList<>();
        for (Declaration decl : paras.list)  {
            paraPos.add(pos);
            paraName.add(decl.name.num);
            paraSize.add(decl.type.size);
            paraRe.add(decl.type instanceof RecordType);
            paraAlign.add(IRTBuilder.getAlignSize(decl.type));
            pos += decl.type.size;
        }
        this.st = st;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

package irt;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Decl implements IRTNode {

    public int id, size, align;
    public boolean isArray, isStruct;
    public LinkedList<Pair> init;

    public Decl(int id, int size, int align, boolean isArray, boolean isStruct, LinkedList<Pair> init) {
        this.id = id;
        this.size = size;
        this.align = align;
        this.isArray = isArray;
        this.isStruct = isStruct;
        this.init = init;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}



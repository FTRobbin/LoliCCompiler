package irt;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class Decl implements IRTNode {

    public int id, size;
    public boolean isArray;
    public LinkedList<Pair> init;

    public Decl(int id, int size, boolean isArray, LinkedList<Pair> init) {
        this.id = id;
        this.size = size;
        this.isArray = isArray;
        this.init = init;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}



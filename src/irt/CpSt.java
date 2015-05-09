package irt;

import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class CpSt extends Stat implements IRTNode {

    public LinkedList<IRTNode> list;

    public CpSt(LinkedList<IRTNode> list) {
        this.list = list;
    }

    @Override
    public int accept(IRTVisitor v) {
        return v.visit(this);
    }
}

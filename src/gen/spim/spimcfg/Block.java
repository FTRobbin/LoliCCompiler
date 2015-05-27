package gen.spim.spimcfg;

import gen.advanced.SPIMInfRegister;
import gen.spim.SPIMInst;

import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/27.
 */
public class Block {

    public LinkedList<SPIMInst> insts;

    public HashSet<Block> prec, succ;

    public Block() {
        insts = new LinkedList<>();
        prec = new HashSet<>();
        succ = new HashSet<>();
    }

    public void addInst(SPIMInst inst) {
        insts.add(inst);
        if (inst.label != null) {
            inst.label.block = this;
        }
    }

    public int size() {
        return insts.size();
    }

    public void addEdge(Block b) {
        this.succ.add(b);
        b.prec.add(this);
    }

    public HashSet<SPIMInfRegister> def, use, liveIn, liveOut;
}

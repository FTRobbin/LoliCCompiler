package analysis.cfg;

import analysis.AssignCopyPair;
import analysis.Subexpression;
import mir.AssignInst;
import mir.MIRInst;
import mir.PhiInst;
import mir.VarName;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/9.
 */
public class Block implements Comparable<Block>{

    public int id;
    public List<MIRInst> insts;
    public HashSet<Block> succ, prec;

    public Block() {
        insts = new LinkedList<>();
        succ = new HashSet<>();
        prec = new HashSet<>();
    }

    public void setNum(int id) {
        this.id = id;
    }

    @Override
    public int compareTo(Block o) {
        if (this.id < ((Block)o).id) {
            return -1;
        } else if (this.id == ((Block)o).id) {
            return 0;
        } else {
            return 1;
        }
    }

    public void addInst(MIRInst inst) {
        inst.block = this;
        insts.add(inst);
    }

    public void addEdge(Block block) {
        succ.add(block);
        block.prec.add(this);
    }

    public String print() {
        String ret = "Vertex " + id + " :\n";
        for (MIRInst inst : insts) {
            List<String> list = inst.print();
            for (String s : list) {
                ret += s + "\n";
            }
        }
        for (Block block : succ) {
            ret += " -> Vertex " + block.id + "\n";
        }
        return ret;
    }

    public HashSet<VarName> def, use, liveIn, liveOut;

    public Block idom = null;

    public HashSet<Block> children;

    public void addChild(Block block) {
        children.add(block);
    }

    public HashSet<Block> frontier;

    public HashSet<VarName> orig;

    public HashMap<VarName, PhiInst> phiHeader;

    public String printSSA() {
        String ret = "Vertex " + id + " :\n";
        HashSet<PhiInst> set = new HashSet<>(phiHeader.values());
        for (PhiInst inst : set) {
            List<String> list = inst.print();
            for (String s : list) {
                ret += s + "\n";
            }
        }
        for (MIRInst inst : insts) {
            List<String> list = inst.print();
            for (String s : list) {
                ret += s + "\n";
            }
        }
        for (Block block : succ) {
            ret += " -> Vertex " + block.id + "\n";
        }
        return ret;
    }

    public Loop loop = null;

    public HashSet<Subexpression> genSub, inSub, outSub;
    public HashMap<Subexpression, AssignInst> whereSub;

    public HashSet<AssignCopyPair> genCopy, inCopy, outCopy;
}

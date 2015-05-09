package analysis.cfg;

import mir.VarName;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Robbin Ni on 2015/5/9.
 */
public class Graph {
    public int n;
    public ArrayList<Block> ver;
    public ArrayList<HashSet<Block>> edge;

    public Graph() {
        n = 0;
        ver = new ArrayList<>();
        edge = new ArrayList<>();
    }

    public void addBlock(Block block) {
        block.setNum(n);
        ++n;
        ver.add(block);
        edge.add(block.succ);
    }

    public String print() {
        String ret = "";
        for (Block block : ver) {
            ret += block.print();
        }
        return ret;
    }

    public String printSSA() {
        String ret = "";
        for (Block block : ver) {
            ret += block.printSSA();
        }
        return ret;
    }

}

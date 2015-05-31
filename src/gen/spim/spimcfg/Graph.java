package gen.spim.spimcfg;

import gen.advanced.SPIMInfRegister;

import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/27.
 */
public class Graph {

    public LinkedList<Block> blocks;

    public HashSet<SPIMInfRegister> used;

    public HashSet<Graph> calls;

    public Graph() {
        blocks = new LinkedList<>();
        used = new HashSet<>();
        calls = new HashSet<>();
    }

    public void addBlock(Block block) {
        blocks.add(block);
    }
}

package gen.spim.spimcfg;

import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/27.
 */
public class Graph {

    public LinkedList<Block> blocks;

    public Graph() {
        blocks = new LinkedList<>();
    }

    public void addBlock(Block block) {
        blocks.add(block);
    }
}

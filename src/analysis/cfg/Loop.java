package analysis.cfg;

import mir.VarName;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class Loop implements Comparable<Loop>{

    public LinkedList<Block> blocks;

    public HashSet<Loop> inner;

    public Loop outer;

    public int id = -1;

    public Loop() {
        blocks = new LinkedList<>();
        inner = new HashSet<>();
        outer = null;
    }

    @Override
    public int compareTo(Loop o) {
        if (this.size() < o.size()) {
            return -1;
        } else if (this.size() == o.size()) {
            return 0;
        } else {
            return 1;
        }
    }

    public int size() {
        return blocks.size();
    }

    public boolean contain(Loop loop) {
        if (this.size() < loop.size()) {
            return false;
        }
        for (Block b : loop.blocks) {
            if (!blocks.contains(b)) {
                return false;
            }
        }
        return true;
    }

    public boolean equals(Loop loop) {
        return this.contain(loop) && this.size() == loop.size();
    }

    public HashSet<VarName> use, def, liveOut;
}

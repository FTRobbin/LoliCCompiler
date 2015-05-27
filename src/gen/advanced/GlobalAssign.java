package gen.advanced;

import analysis.cfg.Block;
import analysis.cfg.Graph;
import analysis.cfg.Loop;
import gen.spim.SPIMPhysicalRegister;
import mir.DeRefVar;
import mir.ProgUnit;
import mir.Program;
import mir.VarName;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class GlobalAssign {

    public HashMap<VarName, Integer> counter;

    public GlobalAssign() {
        counter = new HashMap<>();
    }

    public void add(VarName var, Integer inc) {
        if (var.isTemp || var instanceof DeRefVar || var.isArray || var.isStruct || var.isFunc || var.isPara != -1) {
            return;
        }
        if (!counter.containsKey(var)) {
            counter.put(var, 0);
        }
        counter.put(var, counter.get(var) + inc);
    }

    public void countGraph(Graph g) {
        for (Block b : g.ver) {
            if (b.loop == null) {
                for (VarName var : b.use) {
                    add(var, 1);
                }
                for (VarName var : b.liveOut) {
                    if (b.def.contains(var)) {
                        add(var, 2);
                    }
                }
            }
        }
        for (Loop loop : g.loops) {
            loop.use = loop.blocks.getFirst().use;
            HashSet<Block> done = new HashSet<>();
            for (Block b : loop.blocks) {
                if (done.contains(b)) {
                    continue;
                }
                if (b.loop != loop) {
                    Loop loop1 = b.loop;
                    for (VarName var : loop1.use) {
                        add(var, 2);
                    }
                    for (VarName var : loop1.liveOut) {
                        if (loop1.def.contains(var)) {
                            add(var, 4);
                        }
                    }
                    done.addAll(loop1.blocks);
                } else {
                    for (VarName var : b.use) {
                        add(var, 2);
                    }
                    for (VarName var : b.liveOut) {
                        if (b.def.contains(var)) {
                            add(var, 4);
                        }
                    }
                }
            }
            loop.def = new HashSet<>();
            loop.liveOut = new HashSet<>();
            for (Block b : loop.blocks) {
                loop.def.addAll(b.def);
                for (Block b1 : b.succ) {
                    if (!loop.blocks.contains(b1)) {
                        loop.liveOut.addAll(b1.liveIn);
                    }
                }
            }
            /*
            System.out.println("Loop #" + loop.id);
            System.out.println("Defined:");
            for (VarName var : loop.def) {
                System.out.println(var.name);
            }
            System.out.println("LiveOut:");
            for (VarName var : loop.liveOut) {
                System.out.println(var.name);
            }
            */
        }
    }

    public AdvEnvr assign(Program prog) {
        for (ProgUnit unit : prog.list) {
            countGraph(unit.graph);
        }
        AdvEnvr ret = new AdvEnvr();
        Set<VarName> vars = counter.keySet();
        for (VarName var : vars) {
            //System.out.println(var.name + " : " + counter.get(var));
            if (counter.get(var) >= 10 && var.size == 4) {
                if (var.uid == 0 && ret.cnt < 8) {
                    ret.bond.put(var, SPIMPhysicalRegister.getGlobal(ret.cnt++));
                } else {
                    ret.bond.put(var, new SPIMInfRegister(null));
                }
            }
        }
        return ret;
    }
}

package gen.advanced;

import gen.spim.*;
import gen.spim.spimcfg.Block;
import gen.spim.spimcfg.Graph;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class RegisterAllocate {

    HashSet<SPIMInfRegister> cur;

    HashMap<SPIMInfRegister, HashSet<SPIMInfRegister>> edges;

    public void addRegEdge(SPIMInfRegister u, SPIMInfRegister v) {
        if (!edges.containsKey(u)) {
            edges.put(u, new HashSet<>());
        }
        if (!edges.containsKey(v)) {
            edges.put(v, new HashSet<>());
        }
        edges.get(u).add(v);
        edges.get(v).add(u);
    }

    public void destory(SPIMValue val) {
        if (val instanceof SPIMInfRegister) {
            SPIMInfRegister reg = (SPIMInfRegister)val;
            cur.remove(reg);
            for (SPIMInfRegister reg1 : cur) {
                addRegEdge(reg, reg1);
            }
            if (!edges.containsKey(reg)) {
                edges.put(reg, new HashSet<>());
            }
        }
    }

    public void create(SPIMValue val) {
        SPIMInfRegister reg = null;
        if (val instanceof SPIMInfRegister) {
            reg = (SPIMInfRegister)val;
        }
        if (val instanceof SPIMAddress && ((SPIMAddress) val).regi != null) {
            if (((SPIMAddress) val).regi instanceof SPIMInfRegister) {
                reg = (SPIMInfRegister)(((SPIMAddress) val).regi);
            }
        }
        if (reg != null) {
            if (!cur.contains(reg)) {
                for (SPIMInfRegister reg1 : cur) {
                    addRegEdge(reg, reg1);
                }
                cur.add(reg);
            }
            if (!edges.containsKey(reg)) {
                edges.put(reg, new HashSet<>());
            }
        }
    }

    public void cutDef(SPIMInst inst) {
        if (inst.label == null) {
            if (inst.op.def > 0) {
                destory(inst.val0);
            }
            if (inst.op.def > 1) {
                destory(inst.val1);
            }
            if (inst.op.def > 2) {
                destory(inst.val2);
            }
        }
    }

    public void addUse(SPIMInst inst) {
        if (inst.label == null) {
            if (inst.op.use > 0 && inst.op.def < 1) {
                create(inst.val0);
            }
            if (inst.op.use > 1 && inst.op.def < 2) {
                create(inst.val1);
            }
            if (inst.op.use > 2 && inst.op.def < 3) {
                create(inst.val2);
            }
        }
    }

    public void addEdge(Block b) {
        cur = (HashSet<SPIMInfRegister>)b.liveOut.clone();
        for (int i = b.size() - 1; i >= 0; --i) {
            cutDef(b.insts.get(i));
            addUse(b.insts.get(i));
        }
    }

    public AdvEnvr envr;
    public HashMap<SPIMInfRegister, SPIMPhysicalRegister> table;

    public void graphPaint() {
        int total = 18 - envr.cnt;
        LinkedList<SPIMInfRegister> kicked = new LinkedList<>();
        LinkedList<HashSet<SPIMInfRegister>> kickeg = new LinkedList<>();
        while (edges.size() > 0) {
            SPIMInfRegister kick = null;
            for (SPIMInfRegister reg : edges.keySet()) {
                if (edges.get(reg).size() < total) {
                    kick = reg;
                    break;
                }
            }
            if (kick == null) {
                kick = edges.keySet().iterator().next();
                //throw new InternalError("Graph can't be dyed in " + total + " colors naively!\n");
            }
            kicked.push(kick);
            kickeg.push(edges.get(kick));
            for (SPIMInfRegister reg1 : edges.get(kick)) {
                edges.get(reg1).remove(kick);
            }
            edges.remove(kick);
        }
        while (kicked.size() > 0) {
            SPIMInfRegister cur = kicked.pop();
            HashSet<SPIMInfRegister> curE = kickeg.pop();
            HashSet<SPIMPhysicalRegister> used = new HashSet<>();
            for (SPIMInfRegister reg : curE) {
                used.add(table.get(reg));
            }
            for (int base = 0; base < total; ++base) {
                if (!used.contains(SPIMPhysicalRegister.getGlobal(base + envr.cnt))) {
                    table.put(cur, SPIMPhysicalRegister.getGlobal(base + envr.cnt));
                    break;
                }
            }
            if (!table.containsKey(cur)) {
                throw new InternalError("Error in graph painting!\n");
            }
        }
    }

    public HashMap<SPIMInfRegister, SPIMPhysicalRegister> gen(SPIMCode code, AdvEnvr envr) {
        edges = new HashMap<>();
        this.envr = envr;
        SPIMControlFlow.ControlFlowGraph(code);
        SPIMLiveness.LivenessAnalysis(code);
        //System.out.println(SPIMLiveness.print(code));
        for (Graph g : code.graphs) {
            for (Block b : g.blocks) {
                addEdge(b);
            }
        }
        table = new HashMap<>();
        graphPaint();
        return table;
    }
}

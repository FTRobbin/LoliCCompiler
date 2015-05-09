package mir;

import analysis.ControlFlowGraph;
import analysis.cfg.Graph;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class ProgUnit {

    public Label label;
    public LinkedList<MIRInst> list;

    public ProgUnit() {
        label = null;
        list = new LinkedList<>();
    }

    public ProgUnit(Label label) {
        this.label = label;
        list = new LinkedList<>();
    }

    public void addInst(MIRInst inst) {
        list.add(inst);
    }

    public void addInst(List<MIRInst> insts) {
        list.addAll(insts);
    }

    public List<String> print() {
        LinkedList<String> ret = new LinkedList<>();
        ret.add(label.name + ":");
        ret.add("begin");
        for (MIRInst inst : list)  {
            ret.addAll(inst.print());
        }
        ret.add("end");
        return ret;
    }

    public Graph graph;

    public void dummyCut() {
        LinkedList<MIRInst> list1 = new LinkedList<>();
        for (MIRInst inst : list)  {
            if (inst.label != null && inst.label.isDummy()) {
                inst.label = null;
            }
        }

        int cnt = 0;
        for (MIRInst inst : list)  {
            if (inst instanceof EmptyInst) {
                if (inst.label != null) {
                    if (cnt == list.size() - 1 || list.get(cnt + 1).label != null) {
                        list1.add(inst);
                    } else {
                        list.get(cnt + 1).label = inst.label;
                    }
                }
            } else {
                list1.add(inst);
            }
            ++cnt;
        }
        for (MIRInst inst : list1) {
            if (inst.label != null) {
                inst.label.inst = inst;
            }
        }
        list = list1;
    }

    public ProgUnit getCFG() {
        graph = new Graph();
        ControlFlowGraph.markLeader(list);
        ControlFlowGraph.cutBlocks(list, graph);
        ControlFlowGraph.addEdges(list, graph);
        return this;
    }

    public String printCFG() {
        return this.label.name + ":\n" + graph.print();
    }

    public String printSSA() {
        return this.label.name + ":\n" + graph.printSSA();
    }
}

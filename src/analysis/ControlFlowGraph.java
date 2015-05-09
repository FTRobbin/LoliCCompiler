package analysis;

import analysis.cfg.Block;
import analysis.cfg.Graph;
import mir.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/5/9.
 */
public class ControlFlowGraph {

    public static Program getCFG(Program prog) {
        return prog.getCFG();
    }

    public static void markLeader(List<MIRInst> list) {
        boolean isfirst = true, isafterIf = false, istarget = false;
        for (MIRInst inst : list) {
            istarget = inst.label != null;
            inst.isLeader = isfirst || isafterIf || istarget;
            isfirst = false;
            isafterIf = inst instanceof BranchInst || inst instanceof ReturnInst;
        }
    }

    public static void cutBlocks(List<MIRInst> list, Graph g) {
        Block cur = new Block(), entry = cur; //entry
        g.addBlock(cur);
        for (MIRInst inst : list) {
            if (inst.isLeader) {
                Block old = cur;
                cur = new Block();
                if (old.equals(entry) || !((old.insts.get(old.insts.size() - 1) instanceof GotoInst) || old.insts.get(old.insts.size() - 1) instanceof ReturnInst)) {
                    old.addEdge(cur);
                }
                g.addBlock(cur);
            }
            cur.addInst(inst);
        }
        Block exit = new Block();
        g.addBlock(exit);
        for (Block block : g.ver) {
            if (!block.equals(entry) && !block.equals(exit) && (block.insts.get(block.insts.size() - 1) instanceof ReturnInst || block.equals(cur))) {
                block.addEdge(exit);
            }
        }
    }

    public static void addEdges(List<MIRInst> list, Graph g) {
        for (Block block : g.ver) {
            for (MIRInst inst : block.insts) {
                if (inst instanceof BranchInst) {
                    Block target = ((BranchInst)inst).target.inst.block;
                    block.addEdge(target);
                }
            }
        }
    }

    public static void calDominator(Program prog) {
        for (ProgUnit unit : prog.list) {
            calDominator(unit.graph);
        }
    }

    public static void calDominator(Graph g) {
        int n = g.n;
        int[] num = new int[n], fa = new int[n];
        boolean[] vis = new boolean[n];
        for (int i = 0; i < n; ++i) {
            vis[i] = false;
        }
        ArrayList<Integer> ord = new ArrayList<>();

        int[] semi = new int[n], idom = new int[n];
        ArrayList<LinkedList<Integer>> buf = new ArrayList<>();
        for (int i = 0; i < n; ++i) {
            buf.add(new LinkedList<>());
        }
        int[] sameAs = new int[n];
        int[] fs = new int[n], mins = new int[n];

        class anonymous {
            public void dfs (Block block){
                int u = block.id;
                num[u] = ord.size();
                ord.add(u);
                vis[u] = true;
                for (Block block1 : block.succ) {
                    int v = block1.id;
                    if (vis[v]) {
                        continue;
                    }
                    fa[v] = u;
                    dfs(block1);
                }
            }

            public int find(int u) {
                if (u == fs[u]) {
                    return u;
                } else {
                    int f = find(fs[u]);
                    if (mins[fs[u]] != -1) {
                        if (num[semi[mins[fs[u]]]] < num[semi[mins[u]]]) {
                            mins[u] = mins[fs[u]];
                        }
                    }
                    return fs[u] = f;
                }
            }

            public void merge(int u, int v) {
                fs[u] = v;
            }

            public void domi() {
                for (int i = 0; i < n; ++i) {
                    fs[i] = i;
                    mins[i] = -1;
                }
                for (int i = ord.size() - 1; i > 0; --i) {
                    int u = ord.get(i), p = fa[u], s = p;
                    Block block = g.ver.get(u);
                    for (Block block1 : block.prec) {
                        int v = block1.id, tmp;
                        if (num[v] <= num[u]) {
                            tmp = v;
                        } else {
                            find(v);
                            tmp = semi[mins[v]];
                        }
                        if (num[tmp] < num[s]) {
                            s = tmp;
                        }
                    }
                    semi[u] = s;
                    buf.get(s).add(u);
                    mins[u] = u;
                    merge(u, p);
                    for (Integer v : buf.get(p)) {
                        find(v);
                        int y = mins[v];
                        if (semi[y] == semi[v]) {
                            idom[v] = semi[v];
                            sameAs[v] = -1;
                        } else {
                            sameAs[v] = y;
                        }
                    }
                    buf.get(p).clear();
                }
                for (Integer u : ord) {
                    if (sameAs[u] != -1) {
                        idom[u] = idom[sameAs[u]];
                    }
                }
            }
        }

        int r = 0;
        fa[r] = -1;
        idom[r] = r;
        anonymous tmp = new anonymous();
        tmp.dfs(g.ver.get(0));
        tmp.domi();

        for (int i = 0; i < n; ++i) {
            g.ver.get(i).children = new HashSet<>();
        }
        for (int i = 0; i < n; ++i) {
            //System.out.println("Vertex " + i + " idom is vertex " + idom[i]);
            g.ver.get(i).idom = g.ver.get(idom[i]);
            if (!g.ver.get(i).idom.equals(g.ver.get(i))) {
                g.ver.get(idom[i]).addChild(g.ver.get(i));
            }
        }
    }
}

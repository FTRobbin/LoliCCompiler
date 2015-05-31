package analysis;

import analysis.cfg.Block;
import analysis.cfg.Graph;
import analysis.cfg.Loop;
import mir.*;

import java.util.*;

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

    public static void edgeSplitForm(ProgUnit unit) {
        LinkedList<Block> us = new LinkedList<>(), vs = new LinkedList<>();
        for (Block b : unit.graph.ver) {
            if (b.succ.size() > 1) {
                for (Block b1 : b.succ) {
                    if (b1.prec.size() > 1) {
                        us.add(b);
                        vs.add(b1);
                    }
                }
            }
        }
        for (int i = 0; i < us.size(); ++i) {
            Block u = us.get(i), v = vs.get(i);
            if (v.insts.size() == 0) {
                //exit no phi function will get here
                continue;
            }
            Label vlabel = v.insts.get(0).label, zlabel = new Label();
            IfInst inst = (IfInst)u.insts.get(u.insts.size() - 1);
            Block z = new Block();
            GotoInst ginst = (GotoInst)((new GotoInst(vlabel)).setLabel(zlabel));
            z.addInst(ginst);
            unit.addInst(ginst);
            unit.graph.addBlock(z);
            inst.target = zlabel;
            u.succ.remove(v);
            v.prec.remove(u);
            u.addEdge(z);
            z.addEdge(v);
        }
    }

    public static void turnToEdgeSplit(Program prog) {
        for (ProgUnit unit : prog.list) {
            edgeSplitForm(unit);
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

    public static void markNaturalLoops(Program prog) {
        for (ProgUnit unit : prog.list) {
            markNatrualLoops(unit.graph);
        }
    }

    public static void markNatrualLoops(Graph g) {
        int n = g.n;
        int[] vis = new int[n];
        for (int i = 0; i < n; ++i) {
            vis[i] = 0;
        }

        LinkedList<Block> retu = new LinkedList<>(), retv = new LinkedList<>();

        class anonymous {
            int stamp = 0;

            public boolean isDominator(Block u, Block v) {
                while (u.idom.id != 0) {
                    if (u == v) {
                        return true;
                    }
                    u = u.idom;
                }
                return false;
            }

            public void findEdge (Block block){
                int u = block.id;
                vis[u] = stamp;
                for (Block block1 : block.succ) {
                    int v = block1.id;
                    if (vis[v] == stamp) {
                        if (isDominator(block, block1)) {
                            retu.add(block);
                            retv.add(block1);
                        }
                        continue;
                    }
                    findEdge(block1);
                }
            }

            public void markLoop(Block block, Loop loop){
                int u = block.id;
                vis[u] = stamp;
                loop.blocks.add(block);
                for (Block block1 : block.prec) {
                    int v = block1.id;
                    if (vis[v] == stamp) {
                        continue;
                    }
                    markLoop(block1, loop);
                }
            }
        }

        anonymous tmp = new anonymous();
        tmp.stamp++;
        tmp.findEdge(g.ver.get(0));

        g.loops = new LinkedList<>();

        for (int i = 0; i < retu.size(); ++i) {
            tmp.stamp++;
            vis[retv.get(i).id] = tmp.stamp;
            Loop loop = new Loop();
            loop.blocks.add(retv.get(i));
            tmp.markLoop(retu.get(i), loop);
            boolean isnew = true;
            for (Loop loop1 : g.loops) {
                if (loop1.equals(loop)) {
                    isnew = false;
                    break;
                }
            }
            if (isnew) {
                loop.id = g.loops.size();
                g.loops.add(loop);
            }
        }

        Collections.sort(g.loops);

        for (Loop loop : g.loops) {
            Loop mins = null;
            for (Loop loop1 : g.loops) {
                if (loop1.size() > loop.size() && loop1.contain(loop) && (mins == null || loop1.size() < mins.size())) {
                    mins = loop1;
                }
            }
            if (mins != null) {
                mins.inner.add(loop);
                loop.outer = mins;
            } else {
                loop.outer = null;
            }
        }

        for (Loop loop : g.loops) {
            Collections.sort(loop.blocks);
            for (Block b : loop.blocks) {
                if (b.loop == null || b.loop.size() > loop.size()) {
                    b.loop = loop;
                }
            }
        }

        /*
        for (Loop loop : g.loops) {
            System.out.println("Loop #" + loop.id);
            for (Loop loop1 : loop.inner) {
                if (loop1.outer == loop) {
                    System.out.println("Directly contains: #" + loop1.id);
                }
            }
            for (Block b : loop.blocks) {
                if (b.loop == loop) {
                    System.out.println("Directly Contains block: #" + b.id);
                }
            }
        }
        */
    }
}

package analysis;

import analysis.cfg.Block;
import analysis.cfg.Graph;
import ast.nodes.declaration.ParaList;
import com.intellij.vcs.log.Hash;
import mir.*;

import java.util.*;

/**
 * Created by Robbin Ni on 2015/5/10.
 */
public class StaticSingleAssignment {

    public static Program turntoSSA(Program prog) {
        for (ProgUnit unit : prog.list) {
            calUsage(unit.graph);
            calDominaceFrontier(unit.graph);
            insertPhiFunction(unit.graph);
            renameVariables(unit.graph);
        }
        return prog;
    }

    public static void calUsage(Graph g) {
        HashSet<VarName> set = new HashSet<>();

        class anonymous {
            public int cnt = 0;

            public int[] num = new int[g.n];

            public void addUsage(MIRInst inst, HashSet<VarName> usage) {
                if (inst instanceof AssignInst) {
                    usage.add(((AssignInst) inst).dest);
                } else if (inst instanceof CallInst)  {
                    usage.add(((CallInst) inst).dest);
                } else if (inst instanceof MemInst) {
                    usage.add(((MemInst) inst).var);
                } else if (inst instanceof RecvInst) {
                    usage.add(((RecvInst) inst).var);
                }
                /*
                if (inst instanceof AssignInst) {
                    AssignInst assi = (AssignInst)inst;
                    if (assi.src1 != null && assi.src1 instanceof VarName) {
                        usage.add((VarName)assi.src1);
                    }
                    if (assi.src2 != null && assi.src2 instanceof VarName) {
                        usage.add((VarName)assi.src2);
                    }
                } else if (inst instanceof IfInst) {
                    IfInst ifin = (IfInst)inst;
                    if (ifin.src1 != null && ifin.src1 instanceof VarName) {
                        usage.add((VarName)ifin.src1);
                    }
                    if (ifin.src2 != null && ifin.src2 instanceof VarName) {
                        usage.add((VarName)ifin.src2);
                    }
                } else if (inst instanceof CallInst) {
                    CallInst call = (CallInst)inst;
                    if (call.func instanceof VarName) {
                        usage.add((VarName)call.func);
                    }
                } else if (inst instanceof ParaInst) {
                    ParaInst para = (ParaInst)inst;
                    if (para.val != null && para.val instanceof VarName) {
                        usage.add((VarName)para.val);
                    }
                }
                */
            }

            public void dfs(Block u) {
                num[u.id] = cnt;
                for (MIRInst inst : u.insts) {
                    addUsage(inst, set);
                }
                for (Block v : u.succ) {
                    if (num[v.id] != cnt) {
                        dfs(v);
                    }
                }
            }

        }
        anonymous tmp = new anonymous();
        tmp.cnt = 1;
        for (int i = 0; i < g.n; ++i) {
            tmp.num[i] = 0;
        }
        tmp.dfs(g.ver.get(0));
        for (VarName var : set) {
            g.ver.get(0).insts.add(new AssignInst(ExprOp.dcl, var));
        }
    }

    public static void calDominaceFrontier(Graph g) {
        int n = g.n;
        int[] num = new int[n];
        for (int i = 0; i < n; ++i) {
            num[i] = -1;
        }
        class anonymous {
            int cnt = 0;
            public void dfs(Block u) {
                num[u.id] = cnt++;
                u.frontier = new HashSet<>();
                for (Block v : u.succ) {
                    if (!v.idom.equals(u)) {
                        u.frontier.add(v);
                    }
                }
                for (Block c : u.children) {
                    dfs(c);
                }
                for (Block c : u.children) {
                    for (Block v : c.frontier) {
                        if (num[v.id] <= num[u.id]) {
                            u.frontier.add(v);
                        }
                    }
                }
                /*
                System.out.println("Block " + u.id);
                for (Block v : u.frontier) {
                    System.out.println("<-Block " + v.id);
                }
                */
            }
        }
        anonymous tmp = new anonymous();
        tmp.dfs(g.ver.get(0));
    }

    static VarName getDefi(MIRInst inst) {
        if (inst instanceof AssignInst) {
            return ((AssignInst) inst).dest;
        } else if (inst instanceof CallInst)  {
            return ((CallInst) inst).dest;
        } else if (inst instanceof MemInst) {
            return ((MemInst) inst).var;
        } else if (inst instanceof RecvInst) {
            return ((RecvInst) inst).var;
        }
        return null;
    }

    public static void insertPhiFunction(Graph g) {
        HashMap<VarName, HashSet<Block>> defs = new HashMap<>();
        for (Block block : g.ver) {
            block.phiHeader = new HashMap<>();
            block.orig = new HashSet<>();
            for (MIRInst inst : block.insts) {
                VarName var = getDefi(inst);
                if (var != null) {
                    block.orig.add(var);
                }
            }
            for (VarName var : block.orig) {
                if (!defs.containsKey(var)) {
                    defs.put(var, new HashSet<>());
                }
                defs.get(var).add(block);
            }
        }
        for (VarName var : defs.keySet()) {
            HashSet<Block> set = defs.get(var);
            LinkedList<Block> list = new LinkedList<>(set);
            while (!list.isEmpty()) {
                Block u = list.pop();
                set.remove(u);
                for (Block v : u.frontier) {
                    if (!v.phiHeader.containsKey(var)) {
                        v.phiHeader.put(var, new PhiInst(var));
                        if (!v.orig.contains(var)) {
                            if (!set.contains(v)) {
                                list.push(v);
                                set.add(v);
                            }
                        }
                    }
                }
            }
        }
    }

    public static void renameVariables(Graph g) {
        class anonymous {
            HashMap<VarName, Integer> count = new HashMap<>();
            HashMap<VarName, LinkedList<VarName>> stack = new HashMap<>();

            void replDefi(MIRInst inst, VarName var) {
                if (inst instanceof AssignInst) {
                    ((AssignInst) inst).dest = var;
                } else if (inst instanceof CallInst)  {
                    ((CallInst) inst).dest = var;
                } else if (inst instanceof MemInst) {
                    ((MemInst) inst).var = var;
                } else if (inst instanceof RecvInst) {
                    ((RecvInst) inst).var = var;
                } else if (inst instanceof PhiInst) {
                    ((PhiInst) inst).dest = var;
                }
            }

            VarName getSSA(VarName varName) {
                if (count.containsKey(varName)) {
                    return stack.get(varName).peek();
                }
                return varName;
            }

            void replUse(MIRInst inst) {
                if (inst instanceof AssignInst) {
                    AssignInst assi = (AssignInst)inst;
                    if (assi.src1 != null && assi.src1 instanceof VarName) {
                        assi.src1 = getSSA((VarName)assi.src1);
                    }
                    if (assi.src2 != null && assi.src2 instanceof VarName) {
                        assi.src2 = getSSA((VarName)assi.src2);
                    }
                } else if (inst instanceof IfInst) {
                    IfInst ifin = (IfInst)inst;
                    if (ifin.src1 != null && ifin.src1 instanceof VarName) {
                        ifin.src1 = getSSA((VarName)ifin.src1);
                    }
                    if (ifin.src2 != null && ifin.src2 instanceof VarName) {
                        ifin.src2 = getSSA((VarName)ifin.src2);
                    }
                } else if (inst instanceof CallInst) {
                    CallInst call = (CallInst)inst;
                    if (call.func instanceof VarName) {
                        call.func = getSSA((VarName)call.func);
                    }
                } else if (inst instanceof ParaInst) {
                    ParaInst para = (ParaInst)inst;
                    if (para.val != null && para.val instanceof VarName) {
                        para.val = getSSA((VarName)para.val);
                    }
                }
            }

            public void dfs(Block u) {
                Set<VarName> set = u.phiHeader.keySet();
                for (VarName var : set) {
                    if (!count.containsKey(var)) {
                        count.put(var, 0) ;
                        stack.put(var, new LinkedList<>());
                    }
                    int nxt = count.get(var);
                    count.put(var, nxt + 1);
                    VarName SSAvar = new SSAVarName(var, nxt);
                    stack.get(var).push(SSAvar);
                    replDefi(u.phiHeader.get(var), SSAvar);
                }
                for (MIRInst inst : u.insts) {
                    replUse(inst);
                    VarName var = getDefi(inst);
                    if (!count.containsKey(var)) {
                        count.put(var, 0) ;
                        stack.put(var, new LinkedList<>());
                    }
                    if (var != null) {
                        int nxt = count.get(var);
                        count.put(var, nxt + 1);
                        VarName SSAvar = new SSAVarName(var, nxt);
                        stack.get(var).push(SSAvar);
                        replDefi(inst, SSAvar);
                    }
                }
                for (Block v : u.succ) {
                    Set<VarName> set1 = v.phiHeader.keySet();
                    for (VarName var : set1) {
                        v.phiHeader.get(var).addVar(getSSA(var));
                    }
                }
                for (Block c : u.children) {
                    dfs(c);
                }
                for (VarName var : set) {
                    stack.get(var).pop();
                }
                for (MIRInst inst : u.insts) {
                    VarName var = getDefi(inst);
                    if (var != null) {
                        stack.get(((SSAVarName)var).ori).pop();
                    }
                }
            }
        }
        anonymous tmp = new anonymous();
        tmp.dfs(g.ver.get(0));
    }

    public static Program eliminateSSA(Program prog) {
        //TODO
        return prog;
    }
}

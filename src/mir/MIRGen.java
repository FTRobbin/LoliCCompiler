package mir;

import ast.nodes.expression.Symbol;
import irt.*;
import irt.factory.*;

import java.util.*;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class MIRGen {

    int scopeNum;
    LinkedList<Integer> scopes;

    LinkedList<HashMap<Integer, VarName>> varTable;

    HashMap<Integer, LinkedList<BranchInst>> toFill;
    HashMap<Integer, LinkedList<Integer>> filld;

    LinkedList<HashMap<Integer, VarName>> funcs;

    Program root;

    void init() {
        scopeNum = 0;
        scopes = new LinkedList<>();
        varTable = new LinkedList<>();

        toFill = new HashMap<>();
        filld = new HashMap<>();

        funcs = new LinkedList<>();

        Label.reset();
        VarName.reset();
    }

    int curScope() {
        return scopes.peek();
    }

    void addScope() {
        scopes.push(scopeNum++);
        varTable.push(new HashMap<>());
        funcs.push(new HashMap<>());
    }

    void delScope() {
        scopes.pop();
        varTable.pop();
        funcs.pop();
    }

    void addEntry(int id, VarName var) {
        varTable.peek().put(id, var);
    }

    public boolean isNested(int id) {
        int i = 0;
        for (HashMap<Integer, VarName> map : funcs) {
            if (i != funcs.size() - 1 && map.containsKey(id)) {
                return true;
            }
            ++i;
        }
        return false;
    }

    public VarName getEntry(int id) {
        for (HashMap<Integer, VarName> map : varTable)  {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        if (funcs.peekLast().containsKey(id)) {
            return funcs.peekLast().get(id);
        }
        for (HashMap<Integer, VarName> map : funcs) {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        System.out.println(Symbol.getstr(id));
        throw new exception.InternalError("Variable not found in MIRGen.\n");
    }

    boolean checkLabelEntry(int id) {
        int cur = curScope();
        return toFill.containsKey(id) && toFill.get(id).size() > 0 && filld.get(id).peek() >= cur;
    }

    void addLabelEntry(int id, Label label) {
        int cur = curScope();
        while (checkLabelEntry(id)) {
            BranchInst inst = toFill.get(id).pop();
            filld.get(id).pop();
            inst.setTarget(label);
        }
    }

    MIRInst getBranch(BranchInst inst, int id) {
        if (!toFill.containsKey(id)) {
            toFill.put(id, new LinkedList<>());
            filld.put(id, new LinkedList<>());
        }
        toFill.get(id).push(inst);
        filld.get(id).push(curScope());
        return inst;
    }

    public Program gen(Prog pr) {
        init();

        root = new Program();

        ProgUnit __global = new ProgUnit(new Label("__global"));
        root.addUnit(__global);
        addScope();

        //STL
        funcs.peek().put(Symbol.getnum("printf"), new VarName(0, "@printf"));
        funcs.peek().put(Symbol.getnum("scanf"), new VarName(0, "@scanf"));
        funcs.peek().put(Symbol.getnum("malloc"), new VarName(0, "@malloc"));
        funcs.peek().put(Symbol.getnum("getchar"), new VarName(0, "@getchar"));

        List<Decl> list = pr.decls;
        for (Decl decl : list) {
            //Global initialization
            __global.addInst(gen(new Label(Label.DUMMY), decl, new Label(Label.DUMMY)));
        }
        Set<Map.Entry<Integer, Func>> set = pr.funcs.entrySet();
        for (Map.Entry<Integer, Func> entry : set) {
            funcs.peek().put(entry.getKey(), new VarName(curScope(), "@" + Symbol.getstr(entry.getKey())));
        }
        for (Map.Entry<Integer, Func> entry : set) {
            root.addUnit(gen(entry.getValue()));
        }
        VarName ret = new VarName();
        __global.addInst(new CallInst(ret, new IntConst(0), getEntry(Symbol.getnum("main"))));
        __global.dummyCut();
        delScope();

        return root;
    }

    public ProgUnit gen(Func func) {
        ProgUnit ret = new ProgUnit(new Label("@" + Symbol.getstr(func.id) + (curScope() > 0 ? "#" + curScope() : "") ));
        if (curScope() > 0) {
            funcs.peek().put(func.id, new VarName(curScope(), "@" + Symbol.getstr(func.id)));
        }
        addLabelEntry(func.id, ret.label);
        addScope();
        VarName retVar = new VarName(curScope(), "#Return");
        addEntry(Symbol.getnum("#Return"), retVar);
        for (int i = 0; i < func.paraSize.size(); ++i) {
            VarName var = new VarName(curScope(), Symbol.getstr(func.paraName.get(i)));
            addEntry(func.paraName.get(i), var);
            ret.addInst(new RecvInst(var, func.paraSize.get(i)));
        }
        Label dummy = new Label(Label.DUMMY);
        ret.addInst(gen(new Label(Label.DUMMY), func.st, dummy));
        if (!dummy.isDummy()) {
            ret.addInst((new ReturnInst()).setLabel(dummy));
        }
        delScope();
        ret.dummyCut();
        return ret;
    }

    public List<MIRInst> genStat(Label cur, IRTNode node, Label next) {
        List<MIRInst> list = new LinkedList<>();
        if (node instanceof Decl) {
            list.addAll(gen(cur, (Decl)node, next));
        } else if (node instanceof CpSt) {
            addScope();
            list.addAll(gen(cur, (CpSt)node, next));
            delScope();
        } else if (node instanceof ExSt) {
            list.addAll(gen(cur, (ExSt)node, next));
        } else if (node instanceof ItSt) {
            list.addAll(gen(cur, (ItSt)node, next));
        } else if (node instanceof JpSt) {
            list.addAll(gen(cur, (JpSt)node, next));
        } else if (node instanceof SeSt) {
            list.addAll(gen(cur, (SeSt)node, next));
        }
        return list;
    }

    public List<MIRInst> gen(Label cur, Decl decl, Label next) {
        List<MIRInst> list = new LinkedList<>();
        VarName var = new VarName(curScope(), Symbol.getstr(decl.id));
        addEntry(decl.id, var);
        list.add((new MemInst(var, decl.size)).setLabel(cur));
        List<Pair> list1 = decl.init;
        if (list1.size() > 0) {
            if (decl.isArray) {
                for (Pair pair : list1) {
                    Label ccur = new Label(Label.DUMMY),
                          cnxt = new Label(Label.DUMMY);
                    Value tmp = gen(ccur, pair.expr, list, cnxt);
                    VarName tmp2 = new VarName();
                    list.add((new AssignInst(ExprOp.add, tmp2, var, new IntConst(pair.id))).setLabel(cnxt));
                    list.add(new AssignInst(ExprOp.asg, tmp2, tmp));
                }
            } else {
                if (list1.size() > 1 || list1.get(0).id != 0) {
                    throw new InternalError("Multi-initialize a non-array.\n");
                }
                Label nxt = new Label(Label.DUMMY);
                Value tmp = gen(new Label(Label.DUMMY), list1.get(0).expr, list, nxt);
                list.add((new AssignInst(ExprOp.asg, var, tmp)).setLabel(nxt));
            }
        }
        return list;
    }

    public List<MIRInst> gen(Label cur, CpSt st, Label next) {
        List<MIRInst> list = new LinkedList<>();
        int cnt = 0;
        Label last = cur;
        for (IRTNode node : st.list) {
            Label ccur = last,
                    cnxt = cnt == st.list.size() - 1 ? next : (last = new Label(Label.DUMMY));
            if (node instanceof Func) {
                if (!ccur.isDummy()) {
                    list.add((new EmptyInst()).setLabel(ccur));
                }
                root.addUnit(gen((Func)node));
            } else {
                ++cnt;
                list.addAll(genStat(ccur, node, cnxt));
            }
        }
        return list;
    }

    public List<MIRInst> gen(Label cur, ExSt st, Label next) {
        List<MIRInst> list = new LinkedList<>();
        gen(cur, st.expr, list, next);
        return list;
    }

    public List<MIRInst> gen(Label cur, ItSt st, Label next) {
        List<MIRInst> list = new LinkedList<>();
        Label expr = new Label(), body = new Label(Label.FALL | Label.DUMMY), inct = new Label(Label.DUMMY), jump = new Label(Label.DUMMY);
        list.addAll(genStat(cur, st.init, expr));
        list.addAll(genRel(expr, st.expr, body, next));
        addScope();
        if (st.inct instanceof ExSt && ((ExSt)st.inct).expr.op instanceof IntOp) {
            list.addAll(genStat(body, st.stat, jump));
            inct = jump;
        } else {
            list.addAll(genStat(body, st.stat, inct));
            list.addAll(genStat(inct, st.inct, jump));
        }
        list.add((new GotoInst(expr)).setLabel(jump));
        if (checkLabelEntry(Symbol.getnum("#CONTINUE"))) {
            addLabelEntry(Symbol.getnum("#CONTINUE"), inct);
        }
        if (checkLabelEntry(Symbol.getnum("#BREAK"))) {
            addLabelEntry(Symbol.getnum("#BREAK"), next);
        }
        delScope();
        return list;
    }

    public List<MIRInst> gen(Label cur, JpSt st, Label next) {
        List<MIRInst> list = new LinkedList<>();
        if (st.cont == JpSt.BREAK) {
            list.add(getBranch(new GotoInst(null), Symbol.getnum("#BREAK")).setLabel(cur));
        } else if (st.cont == JpSt.CONTINUE) {
            list.add(getBranch(new GotoInst(null), Symbol.getnum("#CONTINUE")).setLabel(cur));
        } else if (st.cont == JpSt.RETURN) {
            list.add(new ReturnInst().setLabel(cur));
        }
        return list;
    }

    public List<MIRInst> gen(Label cur, SeSt st, Label next) {
        List<MIRInst> list = new LinkedList<>();
        if (st.fl instanceof ExSt && ((ExSt)st.fl).expr.op instanceof IntOp) {
            Label iftr = new Label(Label.FALL | Label.DUMMY);
            list.addAll(genRel(cur, st.expr, iftr, next));
            list.addAll(genStat(iftr, st.tr, next));
        } else {
            Label trjp = new Label(Label.DUMMY), iftr = new Label(Label.FALL | Label.DUMMY), iffl = new Label(Label.DUMMY);
            list.addAll(genRel(cur, st.expr, iftr, iffl));
            list.addAll(genStat(iftr, st.tr, trjp));
            list.add((new GotoInst(next)).setLabel(trjp));
            list.addAll(genStat(iffl, st.fl, next));
        }
        return list;
    }

    public Value gen(Label cur, Expr expr, List<MIRInst> list, Label next) {
        return expr.op.genIR(cur, list, next, this);
    }

    public List<MIRInst> genRel(Label cur, Expr expr, Label trLa, Label faLa) {
        return genRel(cur, expr, trLa, faLa, false);
    }

    public List<MIRInst> genRel(Label cur, Expr expr, Label trLa, Label faLa, boolean rev) {
        List<MIRInst> list = new LinkedList<>();
        Label branch = new Label(Label.DUMMY);
        //if relation op optimization
        Op lastOp = expr.op;
        while (lastOp instanceof UniIntOp && ((UniIntOp)lastOp).op.equals(UniIntFact.Ops.NOT)) {
            rev = !rev;
            expr = expr.exprs.get(0);
            lastOp = expr.op;
        }
        if (lastOp instanceof BinIntOp && ((BinIntOp)lastOp).op.ordinal() < BinIntFact.Ops.ADD.ordinal()) {
            BinIntOp lastOpb = (BinIntOp)lastOp;
            BinIntFact.Ops op = lastOpb.op;
            Label fatr = null, fafa = null;
            if (trLa.isFall()) {
                rev = !rev;
                fatr = faLa;
                fafa = trLa;
            } else {
                fatr = trLa;
                fafa = faLa;
            }
            if (rev) {
                switch (op.ordinal()) {
                    case 0 : {
                        //LESS
                        lastOpb.op = op = BinIntFact.Ops.GE_OP;
                        break;
                    }
                    case 1 : {
                        //GREATER
                        lastOpb.op = op = BinIntFact.Ops.LE_OP;
                        break;
                    }
                    case 2 : {
                        //LE_OP
                        lastOpb.op = op = BinIntFact.Ops.GREATER;
                        break;
                    }
                    case 3 : {
                        //GE_OP
                        lastOpb.op = op = BinIntFact.Ops.LESS;
                        break;
                    }
                    case 4 : {
                        //EQ_OP
                        lastOpb.op = op = BinIntFact.Ops.NE_OP;
                        break;
                    }
                    case 5 : {
                        //NE_OP
                        lastOpb.op = op = BinIntFact.Ops.EQ_OP;
                        break;
                    }
                    default: {
                        throw new InternalError("Unknown relation op.\n");
                    }
                }
            }
            Label mid = new Label(Label.DUMMY), tcur = new Label(Label.DUMMY);
            Value src1 = gen(cur, expr.exprs.get(0), list, mid);
            Value src2 = gen(mid, expr.exprs.get(1), list, tcur);
            list.add((new IfInst(op.IRRelOp(), src1, src2, fatr)).setLabel(tcur));
            if (!fafa.isFall()) {
                list.add((new GotoInst(fafa)));
            }
        } else if (lastOp instanceof SPRelOp) {
            ((SPRelOp)expr.op).genIfIR(cur, list, trLa, faLa, this, rev);
        } else {
            Value ret = gen(cur, expr, list, branch);
            if (trLa.isFall()) {
                list.add((new IfInst(rev ? RelOp.bne : RelOp.beq, ret, new IntConst(0), faLa)).setLabel(branch));
            } else if (faLa.isFall()) {
                list.add((new IfInst(rev ? RelOp.beq : RelOp.bne, ret, new IntConst(0), trLa)).setLabel(branch));
            } else {
                list.add((new IfInst(rev ? RelOp.bne :RelOp.beq, ret, new IntConst(0), faLa)).setLabel(branch));
                list.add((new GotoInst(trLa)));
            }
        }
        return list;
    }
}

package interpreter;

import ast.nodes.Program;
import ast.nodes.declaration.*;
import ast.nodes.expression.*;
import ast.nodes.initialization.InitList;
import ast.nodes.initialization.InitValue;
import ast.nodes.initialization.Initializer;
import ast.nodes.statment.*;
import ast.nodes.type.*;
import ast.visitors.Visitor;
import exception.InterpretError;
import main.GUIOutput;
import main.Inputer;
import stl.mallocDefi;
import stl.printfDefi;
import stl.scanfDefi;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class FailedInterpreter implements Visitor{

    Inputer input;
    GUIOutput output;

    public void setInput(Inputer input) {
        this.input = input;
    }

    public void setOutput(GUIOutput output) {
        this.output = output;
    }

    HashMap<Integer, FunctionDefi> func;
    LinkedList<HashMap<Integer, Integer>> vari;
    ArrayList<Byte> stack;
    ArrayList<Byte> heap;
    LinkedList<Integer> frameP;
    LinkedList<Type> retType;

    static Integer NONE = 0, CONTINUE = 1, BREAK = 2, RETURN = 3;

    Integer control = 0;

    void addScope() {
        vari.push(new HashMap<Integer, Integer>());
    }

    void delScope() {
        vari.pop();
    }

    Integer findEntry(int id) {
        for (HashMap<Integer, Integer> map : vari) {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        throw new InterpretError("Unable to find a certain variable. Check SemanticCheck.\n");
    }

    void Interpreter() {
        func = new HashMap<Integer, FunctionDefi>();
        vari = new LinkedList<HashMap<Integer, Integer>>();
        stack = new ArrayList<Byte>();
        heap = new ArrayList<Byte>();
        frameP = new LinkedList<Integer>();
        retType = new LinkedList<Type>();
        addScope();
    }

    void init() {
        LinkedList<FunctionDefi> mySTL = new LinkedList<FunctionDefi>();
        mySTL.add(new mallocDefi());
        mySTL.add(new scanfDefi());
        mySTL.add(new printfDefi());
        for (FunctionDefi func : mySTL) {
            this.func.put(func.name.num, func);
        }
    }

    void stackPush(int size) {
        for (int i = 0; i < size; ++i) {
            stack.add((byte)0);
        }
    }

    Integer stackPop(int pos) {
        Integer ret = stackGet(pos, stack.size() - pos);
        stack.remove(pos);
        return ret;
    }

    Integer stackGet(int pos, int len) {
        Integer ret = 0;
        for (int i = pos; i < len; ++i) {
            ret = ret | (stack.get(i) << i * 8);
        }
        return ret;
    }

    void stackCopy(int pos1, int pos2, int size) {

    }

    public void visit (mallocDefi malloc) {
        //TODO
    }

    public void visit (scanfDefi scanf) {

    }

    public void visit (printfDefi printf) {

    }

    void initAssign(Integer pt, Type type, Initializer init) {
        //TODO
    }

    void prescan(Program p) {
        for (Declaration decl : p.list) {
            if (decl instanceof FunctionDefi) {
                FunctionDefi f = (FunctionDefi)decl;
                func.put(f.name.num, f);
            } else {
                decl.accept(this);
            }
        }
    }

    @Override
    public void visit(Program p) {
        init();
        prescan(p);
        Symbol main = new Symbol("main");
        if (func.containsKey(main.num)) {
            int sp = stack.size();
            frameP.push(sp);
            retType.push(((FunctionType) (func.get(main.num).type)).returnType);
            stackPush(((FunctionType) (func.get(main.num).type)).returnType.size);
            func.get(main.num).accept(this);
            Integer ret = stackPop(sp);
            frameP.pop();
            retType.pop();
            output.print("Process exited with return value " + ret + "\n");
        } else {
            throw new InterpretError("\"main\" function not found.\n");
        }

    }

    @Override
    public void visit(DeclList dl) {
        for (Declaration decl : dl.list) {
            decl.accept(this);
        }
    }

    @Override
    public void visit(ParaList pl) {
        throw new InterpretError("ParaList is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(FunctionDefi fd) {
        addScope();
        int rp = frameP.peek(), sp = rp + ((FunctionType)fd.type).returnType.size, cnt = sp;
        for (Declaration decl : fd.paras.list) {
            vari.peek().put(decl.name.num, cnt);
            cnt += decl.type.size;
        }
        fd.body.accept(this);
        control = NONE;
        delScope();
    }

    @Override
    public void visit(VariableDecl vd) {
        int pt = 0;
        if (!vari.peek().containsKey(vd.name.num)) {
            pt = stack.size();
            Type type = vd.type;
            stackPush(type.size);
            vari.peek().put(vd.name.num, pt);
        } else {
            pt = findEntry(vd.name.num);
        }
        if (vd.init != null) {
            initAssign(pt, vd.type, vd.init);
        }
    }

    @Override
    public void visit(FunctionDecl fd) {
        //do nothing
    }

    @Override
    public void visit(TypeDecl td) {
        //do nothing
    }

    @Override
    public void visit(TypeDef td) {
        //do nothing
    }

    @Override
    public void visit(InitValue iv) {
        throw new InterpretError("InitValue is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(InitList il) {
        throw new InterpretError("InitList is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(ArrayType at) {
        throw new InterpretError("ArrayType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(PointerType pt) {
        throw new InterpretError("PointerType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(StructType st) {
        throw new InterpretError("StructType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(UnionType ut) {
        throw new InterpretError("UnionType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(IntType it) {
        throw new InterpretError("IntType is impossible to be visited in the interpreter.");

    }

    @Override
    public void visit(CharType ct) {
        throw new InterpretError("CharType is impossible to be visited in the interpreter.");

    }

    @Override
    public void visit(VoidType vt) {
        throw new InterpretError("VoidType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(DefinedType dt) {
        throw new InterpretError("DefinedType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(FunctionType ft) {
        throw new InterpretError("FunctionType is impossible to be visited in the interpreter.");
    }

    @Override
    public void visit(StatList sl) {
        for (Statement stat : sl.list) {
            stat.accept(this);
            if (control != NONE) {
                break;
            }
        }
    }

    @Override
    public void visit(ExpressionStat es) {
        if (!es.isEmpty()) {
            stackPush(es.expr.retType.size);
            es.expr.accept(this);
            stackPop(es.expr.retType.size);
        }
    }

    @Override
    public void visit(CompoundStat cs) {
        cs.dlst.accept(this);
        cs.slst.accept(this);
    }

    @Override
    public void visit(SelectionStat ss) {
        int pt = stack.size();
        stackPush(ss.expr.retType.size);
        ss.expr.accept(this);
        //Cast
        int cond = stackPop(pt);
        addScope();
        if (cond != 0) {
            ss.iffl.accept(this);
        } else {
            ss.iftr.accept(this);
        }
        delScope();
    }

    @Override
    public void visit(IterationStat is) {
        stackPush(is.init.retType.size);
        is.init.accept(this);
        stackPop(is.init.retType.size);
        int pt = stack.size();
        stackPush(is.expr.retType.size);
        is.expr.accept(this);
        //Cast
        int cond = stackPop(pt);
        while (cond != 0) {
            addScope();
            is.stat.accept(this);
            delScope();
            if (control == NONE || control == CONTINUE) {
                control = NONE;
            } else {
                break;
            }
            stackPush(is.inct.retType.size);
            is.inct.accept(this);
            stackPop(pt);
            stackPush(is.expr.retType.size);
            is.expr.accept(this);
            cond = stackPop(pt);
        }
    }

    @Override
    public void visit(ContinueStat cs) {
        control = CONTINUE;
    }

    @Override
    public void visit(BreakStat bs) {
        control = BREAK;
    }

    @Override
    public void visit(ReturnStat rs) {
        control = RETURN;
        if (!rs.expr.isEmpty()) {
            int pt = stack.size();
            stackPush(rs.expr.retType.size);
            rs.expr.accept(this);
            //TODO memory leakage
            //Cast
            stackCopy(frameP.peek(), pt, retType.peek().size);
            stackPop(pt);
        }
    }

    @Override
    public void visit(ArgumentList al) {
        for (Expression expr : al.list) {
            stackPush(expr.retType.size);
            expr.accept(this);
            //Cast
        }
    }

    @Override
    public void visit(BinaryExpr be) {
        int pt = stack.size();
        stackPush(be.expr1.retType.size);
        be.expr1.accept(this);
        //shortpath
        boolean shortp = false;
        if (!shortp) {
            stackPush(be.expr2.retType.size);
            be.expr2.accept(this);
            //calResult
        }
    }

    @Override
    public void visit(CastExpr ce) {
        int pt = stack.size();
        stackPush(ce.expr.retType.size);
        ce.expr.accept(this);
        //cast
    }

    @Override
    public void visit(UnaryExpr ue) {
        int pt = stack.size();
        stackPush(ue.expr.retType.size);
        ue.expr.accept(this);
        //calResult
    }

    @Override
    public void visit(SizeofExpr se) {
        int pt = stack.size();
        //writeResult
    }

    @Override
    public void visit(FunctionCall fc) {
        int pt = stack.size();
        frameP.push(pt);
        stackPush(fc.func.retType.size);
        fc.func.retType.accept(this);
        FunctionDefi defi = func.get(stackPop(pt));
        stackPush(((FunctionType)defi.type).returnType.size);
        fc.argu.accept(this);
        defi.accept(this);
        stackCopy(pt - fc.retType.size, pt, fc.retType.size);
    }

    @Override
    public void visit(ArrayExpr ar) {

    }

    @Override
    public void visit(PointerAccess pa) {

    }

    @Override
    public void visit(RecordAccess ra) {

    }

    @Override
    public void visit(PostExpr pe) {

    }

    @Override
    public void visit(EmptyExpr ee) {

    }

    @Override
    public void visit(Variable v) {

    }

    @Override
    public void visit(IntConst ic) {

    }

    @Override
    public void visit(CharConst cc) {

    }

    @Override
    public void visit(StringConst sc) {

    }

    @Override
    public void visit(Symbol s) {

    }

    @Override
    public void setOutput(OutputStream out) {

    }
}

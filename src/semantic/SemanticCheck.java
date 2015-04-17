package semantic;

import ast.nodes.Program;
import ast.nodes.declaration.*;
import ast.nodes.expression.*;
import ast.nodes.initialization.InitList;
import ast.nodes.initialization.InitValue;
import ast.nodes.statment.*;
import ast.nodes.type.*;
import ast.visitors.Visitor;
import stl.mallocDefi;
import stl.printfDefi;
import stl.scanfDefi;

import java.io.OutputStream;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/16.
 */
public class SemanticCheck implements Visitor {

    private VariableTable table;
    private StructureTable struct;

    public SemanticCheck() {
        this.table = new VariableTable();
        this.struct = new StructureTable();
        loadSTL();
        this.loopStack = new LinkedList<IterationStat>();
    }

    private LinkedList<FunctionDefi> mySTL;

    private void loadSTL() {
        mySTL = new LinkedList<FunctionDefi>();
        mySTL.add(new mallocDefi());
        mySTL.add(new scanfDefi());
        mySTL.add(new printfDefi());
        for (FunctionDefi func : mySTL) {
            table.addVari(func.name.num, func.type);
        }
    }

    private LinkedList<FunctionDefi> funcStack;

    private void addFunc(FunctionDefi func) {
        funcStack.push(func);
    }

    private void delFunc() {
        funcStack.pop();
    }

    private FunctionDefi topFunc() {
        return funcStack.peek();
    }

    private LinkedList<IterationStat> loopStack;

    private void addLoop(IterationStat loop) {
        loopStack.push(loop);
    }

    private void delLoop() {
        loopStack.pop();
    }

    private IterationStat topLoop() {
        return loopStack.peek();
    }

    private boolean hasLoop() {
        return !loopStack.isEmpty();
    }

    private boolean typeCheck(Type being, Type tobe) {
        //TODO
        return false;
    }

    private Type calBin(int op, Type type1, Type type2) {
        //TODO
        return type1;
    }

    private Type calUnary(int op, Type type) {
        //TODO
        return type;
    }

    private Type calPost(int op, Type type) {
        //TODO
        return type;
    }

    private boolean callCheck(Type func, List<Type> para) {
        //TODO
        return false;
    }

    private void define(Type type) {
        //TODO
    }

    public void setOutput (OutputStream out) {}

    public void visit(Program p) {
        for (Declaration decl : p.list) {
            decl.accept(this);
        }
    }

    public void visit(DeclList dl) {
        for (Declaration decl : dl.list) {
            decl.accept(this);
        }
    }

    public void visit(ParaList pl) {
        for (Declaration decl : pl.list) {
            decl.accept(this);
        }
    }

    public void visit(FunctionDefi fd) {
        define(fd.returnType);
        if (table.checkCurId(fd.name.num)) {
            System.out.println("Identifier " + fd.name.toString() + " redeclared as a different kind of symbol.");
        } else {
            table.addVari(fd.name.num, fd.type);
        }
        table.addScope();
        struct.addScope();
        fd.paras.accept(this);
        addFunc(fd);
        fd.body.accept(this);
        delFunc();
        table.delScope();
        struct.delScope();
    }

    public void visit(VariableDecl vd) {
        define(vd.type);
        if (table.checkCurId(vd.name.num)) {
            System.out.println("Identifier " + vd.name.toString() + " redeclared as a different kind of symbol.");
        } else {
            table.addVari(vd.name.num, vd.type);
        }
    }

    public void visit(FunctionDecl fd) {
        define(fd.type);
        if (table.checkCurId(fd.name.num)) {
            System.out.println("Identifier " + fd.name.toString() + " redeclared as a different kind of symbol.");
        } else {
            table.addVari(fd.name.num, fd.type);
        }
    }

    public void visit(TypeDecl td) {
        define(td.type);
    }

    public void visit(TypeDef td) {
        define(td.type);
        if (table.checkCurId(td.name.num)) {
            System.out.println("Identifier " + td.name.toString() + " redeclared as a different kind of symbol.");
        } else {
            table.addType(td.name.num, td.type);
        }
    }

    public void visit(InitValue iv) {
    }

    public void visit(InitList il) {
    }

    public void visit(ArrayType at) {
    }

    public void visit(PointerType pt) {
    }

    public void visit(StructType st) {
        st.name.accept(this);
        if (st.list != null) {
            st.list.accept(this);
        }
    }

    public void visit(UnionType ut) {
        ut.name.accept(this);
        if (ut.list != null) {
            ut.list.accept(this);
        }
    }

    public void visit(IntType it) {
    }

    public void visit(CharType ct) {
    }

    public void visit(VoidType vt) {
    }

    public void visit(DefinedType dt) {
    }

    public void visit(FunctionType ft) {

    }

    public void visit(NameType nt) {}

    public void visit(StatList sl) {
        for (Statement stat : sl.list) {
            stat.accept(this);
        }
    }

    public void visit(ExpressionStat es) {
        es.expr.accept(this);
    }

    public void visit(CompoundStat cs) {
        cs.dlst.accept(this);
        cs.slst.accept(this);
    }

    public void visit(SelectionStat ss) {
        ss.expr.accept(this);
        if (!typeCheck(ss.expr.retType, new IntType())) {
            System.out.println("Type exception!");
        }
        table.addScope();
        struct.addScope();
        ss.iftr.accept(this);
        table.delScope();
        struct.delScope();
        table.addScope();
        struct.addScope();
        ss.iffl.accept(this);
        table.delScope();
        struct.delScope();
    }

    public void visit(IterationStat is) {
        is.init.accept(this);
        is.expr.accept(this);
        if (!typeCheck(is.expr.retType, new IntType())) {
            System.out.println("Type exception!");
        }
        is.inct.accept(this);
        table.addScope();
        struct.addScope();
        addLoop(is);
        is.stat.accept(this);
        delLoop();
        table.delScope();
        struct.delScope();
    }

    public void visit(ContinueStat cs) {
        if (!hasLoop()) {
            System.out.println("Continue exception!");
        } else {
            cs.target = topLoop();
        }
    }

    public void visit(BreakStat bs) {
        if (!hasLoop()) {
            System.out.println("Break exception!");
        } else {
            bs.target = topLoop();
        }
    }

    public void visit(ReturnStat rs) {
        rs.expr.accept(this);
        if (!typeCheck(rs.expr.retType, topFunc().returnType)) {
            System.out.println("Return type exception!");
        }
    }

    public void visit(EmptyExpr ee) {
        ee.retType = new VoidType();
        ee.retType.isConst = true;
        ee.retType.isLeft = false;
        ee.retType.size = 0;
        ee.retType.value = null;
    }

    public void visit(ArgumentList al) {
        for (Expression expr : al.list) {
            expr.accept(this);
            al.typeList.add(expr.retType);
        }
    }

    public void visit(BinaryExpr be) {
        be.expr1.accept(this);
        be.expr2.accept(this);
        be.retType = calBin(be.op, be.expr1.retType, be.expr2.retType);
    }

    public void visit(CastExpr ce) {
        ce.expr.accept(this);
        if (!typeCheck(ce.expr.retType, ce.type)) {
            System.out.println("Typecast Error!");
        }
        //TODO Warning! need clone it!!!
        ce.retType = ce.type;
    }

    public void visit(UnaryExpr ue) {
        ue.expr.accept(this);
        ue.retType = calUnary(ue.op, ue.expr.retType);
    }

    public void visit(SizeofExpr se) {
        define(se.type);
        se.retType = new IntType();
        se.retType.isConst = true;
        se.retType.isLeft = false;
        se.retType.size = 4;
        se.retType.value = se.type.size;
    }

    public void visit(FunctionCall fc) {
        fc.func.accept(this);
        fc.argu.accept(this);
        if (!callCheck(fc.func.retType, fc.argu.typeList)) {
            System.out.println("Function Call Error!");
        } else {
            //TODO Warning! need clone it!!!
            fc.retType = ((FunctionType) fc.func.retType).returnType;
            fc.retType.isConst = false;
            fc.retType.isLeft = false;
        }
    }

    public void visit(ArrayExpr ar) {
        ar.expr.accept(this);
        ar.addr.accept(this);
        if (!typeCheck(ar.addr.retType, new IntType())) {
            System.out.println("Array Address Error!");
        } else {
            if (!(ar.expr.retType instanceof PointerType)) {
                System.out.println("Array Type Error!");
            } else {
                //TODO Warning! need clone it!!!
                ar.retType = ((PointerType)ar.expr.retType).baseType;
                ar.retType.isConst = false;
                ar.retType.isLeft = true;
            }
        }
    }

    public void visit(PointerAccess pa) {
        pa.expr.accept(this);
        if (!(pa.expr.retType instanceof PointerType)) {
            System.out.println("Pointer Type Error!");
        } else {
            Type type = ((PointerType)pa.expr.retType).baseType;
            if (!(type instanceof RecordType)) {
                System.out.println("Record Type Error!");
            } else{
                RecordType reco = (RecordType)type;
                if (!struct.getId(reco.name.num).checkId(pa.id.num)) {
                    System.out.println("Field Name Error!");
                } else {
                    //TODO Warning! need clone it!!!
                    pa.retType = struct.getId(reco.name.num).getId(pa.id.num);
                    pa.retType.isConst = false;
                    pa.retType.isLeft = true;
                }
            }
        }
    }

    public void visit(RecordAccess ra) {
        Type type = ra.expr.retType;
        if (!(type instanceof RecordType)) {
            System.out.println("Record Type Error!");
        } else{
            RecordType reco = (RecordType)type;
            if (!struct.getId(reco.name.num).checkId(ra.id.num)) {
                System.out.println("Field Name Error!");
            } else {
                //TODO Warning! need clone it!!!
                ra.retType = struct.getId(reco.name.num).getId(ra.id.num);
                ra.retType.isConst = false;
                ra.retType.isLeft = true;
            }
        }
    }

    public void visit(PostExpr pe) {
        pe.expr.accept(this);
        pe.retType = calPost(pe.op, pe.expr.retType);
    }

    public void visit(Variable v) {
        if (!table.checkId(v.id.num)) {
            System.out.println("Identifier " + v.id.toString() + " undefined.");
        } else {
            if (table.checkType(v.id.num) == table.TYPENAME) {
                System.out.println("Typename " + v.id.toString() + " used as variable.");
            } else {
                //TODO Warning! need clone it!!!
                v.retType = table.getId(v.id.num);
                v.retType.isConst = false;
                v.retType.isLeft = true;
            }
        }
    }

    public void visit(IntConst ic) {
        ic.retType = new IntType();
        ic.retType.isConst = true;
        ic.retType.isLeft = false;
        ic.retType.size = 4;
        ic.retType.value = ic.val;
    }

    public void visit(CharConst cc) {
        cc.retType = new CharType();
        cc.retType.isConst = true;
        cc.retType.isLeft = false;
        cc.retType.size = 1;
        cc.retType.value = cc.ch;
    }

    public void visit(StringConst sc) {
        sc.retType = new PointerType(new CharType());
        sc.retType = new CharType();
        sc.retType.isConst = true;
        sc.retType.isLeft = false;
        sc.retType.size = 4;
        sc.retType.value = sc.str;
    }

    public void visit(Symbol s) {
    }

}

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

//TODO : undimensioned array
//TODO : wrong initialization

public class SemanticCheck implements Visitor {

    private VariableTable table;
    private StructureTable struct;

    public SemanticCheck() {
        this.table = new VariableTable();
        this.struct = new StructureTable();
        loadSTL();
        this.funcStack = new LinkedList<FunctionDefi>();
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

    private Type resolve(Type type)  {
        if (type instanceof DefinedType) {
            return resolve(((DefinedType) type).baseType);
        } else {
            return type;
        }
    }

    private boolean typeEqual(Type a, Type b) {
        a = resolve(a);
        b = resolve(b);
        if (a instanceof ArrayType) {
            if (!(b instanceof ArrayType)) {
                return false;
            } else {
                //TODO array dimension
                return a.size.equals(b.size) && typeEqual(((ArrayType) a).baseType, ((ArrayType) b).baseType);
            }
        } else if (a instanceof CharType) {
            return b instanceof CharType;
        } else if (a instanceof FunctionType) {
            if (!(b instanceof FunctionType)) {
                return false;
            } else {
                boolean ret = typeEqual(((FunctionType) a).returnType, ((FunctionType) b).returnType);
                ret = ret && ((FunctionType) a).paraType.size() == ((FunctionType) b).paraType.size();
                for (Integer i = 0; i < ((FunctionType) a).paraType.size() && ret; ++i) {
                    ret = typeEqual(((FunctionType) a).paraType.get(i), ((FunctionType) b).paraType.get(i));
                }
                return ret;
            }
        } else if (a instanceof IntType) {
            return b instanceof IntType;
        } else if (a instanceof PointerType) {
            if (!(b instanceof PointerType)) {
                return false;
            } else {
                return typeEqual(((PointerType) a).baseType, ((PointerType) b).baseType);
            }
        } else if (a instanceof StructType) {
            if (!(b instanceof StructType)) {
                return false;
            } else {
                return ((StructType)a).mem == ((StructType)b).mem;
            }
        } else if (a instanceof UnionType) {
            if (!(b instanceof UnionType)) {
                return false;
            } else {
                return ((UnionType)a).mem == ((UnionType)b).mem;
            }
        } else if (a instanceof VoidType) {
            return b instanceof VoidType;
        } else {
            return false;
        }
    }

    private boolean typeCheck(Type being, Type tobe) {
        return typeEqual(being, tobe) || (typeEqual(being, new CharType()) && typeEqual(tobe, new IntType()));
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

    private boolean callCheck(FunctionType func, List<Type> para) {
        int i = 0, j = 0;
        while (i < func.paraType.size() && j < para.size()) {
            if (func.paraType.get(i) instanceof ELLIPSIS) {
                ++j;
                if (j == para.size()) {
                    ++i;
                }
            } else if (typeEqual(func.paraType.get(i), para.get(j))) {
                ++i;
                ++j;
            } else {
                return false;
            }
        }
        return i == func.paraType.size() && j == para.size();
    }

    private Integer toInt(Object ob) {
        return 0;
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
        fd.type.accept(this);
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
        vd.type.accept(this);
        vd.type = resolve(vd.type);
        if (table.checkCurId(vd.name.num)) {
            System.out.println("Identifier " + vd.name.toString() + " redeclared as a different kind of symbol.");
        } else {
            table.addVari(vd.name.num, vd.type);
        }
    }

    public void visit(FunctionDecl fd) {
        fd.type.accept(this);
        if (table.checkCurId(fd.name.num)) {
            System.out.println("Identifier " + fd.name.toString() + " redeclared as a different kind of symbol.");
        } else {
            table.addVari(fd.name.num, fd.type);
        }
    }

    public void visit(TypeDecl td) {
        td.type.accept(this);
    }

    public void visit(TypeDef td) {
        td.type.accept(this);
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
        at.baseType.accept(this);
        at.cap.accept(this);
        if (!at.cap.retType.isConst) {
            System.out.println("The size of an array must be constant.");
        } else {
            if (!typeCheck(at.cap.retType, new IntType())) {
                System.out.println("The size of an array must be an integer.");
            } else {
                Integer num = toInt(at.cap.retType.value);
                if (num <= 0) {
                    System.out.println("The size of an array must be positive.");
                } else {
                    at.size = at.baseType.size * num;
                }
            }
        }
    }

    public void visit(PointerType pt) {
        pt.baseType.accept(this);
        pt.size = 4;
    }

    public void visit(StructType st) {
        st.size = 0;
        if (st.list == null) {
            if (!struct.checkId(st.name.num)) {
                System.out.println("Structure name undefined.");
            } else {
                st.mem = ((StructType)struct.getId(st.name.num)).mem;
                st.size = ((StructType)struct.getId(st.name.num)).size;
            }
        } else {
            if (struct.checkId(st.name.num)) {
                System.out.println("Structure name redefined.");
            } else {
                st.mem = new MemberTable();
                struct.addEntry(st.name.num, st);
                struct.addScope();
                table.addScope();
                for (Declaration decl : st.list.list) {
                    decl.type.accept(this);
                    if (st.mem.checkId(decl.name.num)) {
                        System.out.println("Duplicated structure field definition.");
                    } else {
                        st.mem.addEntry(decl.name.num, decl.type);
                    }
                    st.size += decl.type.size;
                }
                table.delScope();
                struct.delScope();
            }
        }
    }

    public void visit(UnionType ut) {
        ut.size = 0;
        if (ut.list == null) {
            if (!struct.checkId(ut.name.num)) {
                System.out.println("Union name undefined.");
            } else {
                ut.mem = ((UnionType)struct.getId(ut.name.num)).mem;
                ut.size = ((UnionType)struct.getId(ut.name.num)).size;
            }
        } else {
            if (struct.checkId(ut.name.num)) {
                System.out.println("Union name redefined.");
            } else {
                ut.mem = new MemberTable();
                struct.addEntry(ut.name.num, ut);
                struct.addScope();
                table.addScope();
                for (Declaration decl : ut.list.list) {
                    decl.type.accept(this);
                    if (ut.mem.checkId(decl.name.num)) {
                        System.out.println("Duplicated union field definition.");
                    } else {
                        ut.mem.addEntry(decl.name.num, decl.type);
                    }
                    ut.size = Integer.max(ut.size, decl.type.size);
                }
                table.delScope();
                struct.delScope();
            }
        }
    }

    public void visit(IntType it) {
        it.size = 4;
    }

    public void visit(CharType ct) {
        ct.size = 1;
    }

    public void visit(VoidType vt) {
        vt.size = 0;
    }

    public void visit(DefinedType dt) {
        if (!table.checkId(dt.name.num)) {
            System.out.println("Defined type not found.");
        } else {
            if (table.checkType(dt.name.num) != VariableTable.TYPENAME) {
                System.out.println("Defined type is not a type.");
            } else {
                dt.baseType = table.getId(dt.name.num);
                dt.size = dt.baseType.size;
            }
        }
    }

    public void visit(FunctionType ft) {
        ft.returnType.accept(this);
        for (Type type : ft.paraType) {
            type.accept(this);
        }
        ft.size = 4;
    }

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
            System.out.println("Selection expression type exception.");
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
            System.out.println("Iteration expression type exception.");
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
            System.out.println("Continue not in a loop.");
        } else {
            cs.target = topLoop();
        }
    }

    public void visit(BreakStat bs) {
        if (!hasLoop()) {
            System.out.println("Break not in a loop.");
        } else {
            bs.target = topLoop();
        }
    }

    public void visit(ReturnStat rs) {
        rs.expr.accept(this);
        if (!typeCheck(rs.expr.retType, topFunc().returnType)) {
            System.out.println("Return type exception.");
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
            System.out.println("Typecast Error.");
        }
        ce.retType = ce.type.clone();
        ce.retType.isLeft = false;
    }

    public void visit(UnaryExpr ue) {
        ue.expr.accept(this);
        ue.retType = calUnary(ue.op, ue.expr.retType);
    }

    public void visit(SizeofExpr se) {
        se.type.accept(this);
        se.retType = new IntType();
        se.retType.isConst = true;
        se.retType.isLeft = false;
        se.retType.size = 4;
        se.retType.value = se.type.size;
    }

    public void visit(FunctionCall fc) {
        fc.func.accept(this);
        fc.argu.accept(this);
        if (!(resolve(fc.func.retType) instanceof FunctionType)) {
            System.out.println("Function Call Error!");
        } else {
            if (!callCheck((FunctionType)resolve(fc.func.retType), fc.argu.typeList)) {
            System.out.println("Function Call Error!");
        } else {
            fc.retType = ((FunctionType) fc.func.retType).returnType.clone();
            fc.retType.isConst = false;
            fc.retType.isLeft = false;
        }
        }
    }

    public void visit(ArrayExpr ar) {
        ar.expr.accept(this);
        ar.addr.accept(this);
        if (!typeCheck(ar.addr.retType, new IntType())) {
            System.out.println("Array Address Error!");
        } else {
            if (!(resolve(ar.expr.retType) instanceof PointerType)) {
                System.out.println("Array Type Error!");
            } else {
                ar.retType = ((PointerType)resolve(ar.expr.retType)).baseType.clone();
                ar.retType.isConst = false;
                ar.retType.isLeft = true;
            }
        }
    }

    public void visit(PointerAccess pa) {
        pa.expr.accept(this);
        if (!(resolve(pa.expr.retType) instanceof PointerType)) {
            System.out.println("Pointer Type Error!");
        } else {
            Type type = resolve(((PointerType)resolve(pa.expr.retType)).baseType);
            if (!(type instanceof RecordType)) {
                System.out.println("Record Type Error!");
            } else{
                RecordType reco = (RecordType)type;
                if (!reco.mem.checkId(pa.id.num)) {
                    System.out.println("Field Name Error!");
                } else {
                    pa.retType = reco.mem.getId(pa.id.num).clone();
                    pa.retType.isConst = false;
                    pa.retType.isLeft = true;
                }
            }
        }
    }

    public void visit(RecordAccess ra) {
        Type type = resolve(ra.expr.retType);
        if (!(type instanceof RecordType)) {
            System.out.println("Record Type Error!");
        } else{
            RecordType reco = (RecordType)type;
            if (!reco.mem.checkId(ra.id.num)) {
                System.out.println("Field Name Error!");
            } else {
                ra.retType = reco.mem.getId(ra.id.num).clone();
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
            if (table.checkType(v.id.num) == VariableTable.TYPENAME) {
                System.out.println("Typename " + v.id.toString() + " used as variable.");
            } else {
                v.retType = table.getId(v.id.num).clone();
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

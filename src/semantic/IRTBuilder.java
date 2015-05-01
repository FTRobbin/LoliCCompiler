package semantic;

import ast.nodes.Program;
import ast.nodes.Visible;
import ast.nodes.declaration.*;
import ast.nodes.expression.*;
import ast.nodes.initialization.InitList;
import ast.nodes.initialization.InitValue;
import ast.nodes.initialization.Initializer;
import ast.nodes.statment.*;
import ast.nodes.type.*;
import ast.visitors.PrintAST;
import ast.visitors.Visitor;
import exception.SemanticError;
import irt.*;
import irt.factory.Factories;
import irt.factory.OpFactory;
import parser.Symbols;
import stl.getcharDefi;
import stl.mallocDefi;
import stl.printfDefi;
import stl.scanfDefi;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/16.
 */

//TODO : struct name *p;

public class IRTBuilder implements Visitor {

    private VariableTable table;
    private StructureTable struct;
    int isInPara = 0, isInLoop = 0, isInFunc = 0;

    private void debug(Visible item) {
        Visitor v = new PrintAST();
        OutputStream out = new ByteArrayOutputStream();
        v.setOutput(out);
        item.accept(v);
        System.out.print(out.toString());
    }

    public IRTBuilder() {
        this.table = new VariableTable();
        this.struct = new StructureTable();
        loadSTL();
        this.stack = new LinkedList<IRTNode>();
    }


    private LinkedList<FunctionDefi> mySTL;

    private void loadSTL() {
        mySTL = new LinkedList<FunctionDefi>();
        mySTL.add(new mallocDefi());
        mySTL.add(new scanfDefi());
        mySTL.add(new printfDefi());
        mySTL.add(new getcharDefi());
        for (FunctionDefi func : mySTL) {
            table.addVari(func.name.num, func.type);
        }
    }

    private boolean isGlobal() {
        return isInFunc == 0;
    }

    private boolean hasLoop() {
        return isInLoop > 0;
    }

    private boolean isPara() {
        return isInPara > 0;
    }

    static public boolean typeEqual(Type a, Type b) {
        if (a instanceof ArrayType) {
            if (!(b instanceof ArrayType)) {
                return false;
            } else {
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
            if (!(b instanceof PointerType && !(b instanceof ArrayType))) {
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
            throw new InternalError("Unexpected type error.\n");
        }
    }

    private Type resolve(Type type)  {
        if (type instanceof DefinedType) {
            return resolve(((DefinedType) type).baseType);
        } else {
            return type;
        }
    }

    public static boolean isVoid(Type type) {
        if (isVoidPointer(type)) {
            return false;
        }
        if (type instanceof VoidType) {
            return true;
        } else if (type instanceof PointerType) {
            return isVoid(((PointerType)type).baseType);
        } else {
            return false;
        }
    }

    public static boolean isVoidPointer(Type a) {
        return a instanceof PointerType && !(a instanceof ArrayType) && ((PointerType)a).baseType instanceof VoidType;
    }

    public static int getRank(Type type) {
        if (type instanceof PointerType || type instanceof IntType) {
            return 4;
        } else if (type instanceof CharType) {
            return 1;
        } else {
            return Integer.MAX_VALUE;
        }
    }


    private OpFactory calBin(int op) {
        switch (op) {
            case Symbols.COMMA      : return Factories.COMMA.getFact();
            case Symbols.ASSIGN     : return Factories.ASSIGN.getFact();
            case Symbols.MUL_ASSIGN : return Factories.MULIGN.getFact();
            case Symbols.DIV_ASSIGN : return Factories.DIVIGN.getFact();
            case Symbols.MOD_ASSIGN : return Factories.MODIGN.getFact();
            case Symbols.ADD_ASSIGN : return Factories.ADDIGN.getFact();
            case Symbols.SUB_ASSIGN : return Factories.SUBIGN.getFact();
            case Symbols.SHL_ASSIGN : return Factories.SHLIGN.getFact();
            case Symbols.SHR_ASSIGN : return Factories.SHRIGN.getFact();
            case Symbols.XOR_ASSIGN : return Factories.XORIGN.getFact();
            case Symbols.OR_ASSIGN  : return Factories.ORIGN.getFact();
            case Symbols.AND_ASSIGN : return Factories.ANDIGN.getFact();
            case Symbols.EQ_OP      : return Factories.EQUAL.getFact();
            case Symbols.NE_OP      : return Factories.NEQUAL.getFact();
            case Symbols.ADD        : return Factories.BIADD.getFact();
            case Symbols.SUB        : return Factories.BISUB.getFact();
            case Symbols.MUL        : return Factories.BIMUL.getFact();
            case Symbols.OR         : return Factories.BIOR.getFact();
            case Symbols.XOR        : return Factories.BIXOR.getFact();
            case Symbols.ADRESS     : return Factories.BIAND.getFact();
            case Symbols.LESS       : return Factories.BILES.getFact();
            case Symbols.GREATER    : return Factories.BIGRE.getFact();
            case Symbols.DIV        : return Factories.BIDIV.getFact();
            case Symbols.MOD        : return Factories.BIMOD.getFact();
            case Symbols.OR_OP      : return Factories.LOGOR.getFact();
            case Symbols.AND_OP     : return Factories.LOGAND.getFact();
            case Symbols.LE_OP      : return Factories.BILEQ.getFact();
            case Symbols.GE_OP      : return Factories.BIGEQ.getFact();
            case Symbols.SHL_OP     : return Factories.BISHL.getFact();
            case Symbols.SHR_OP     : return Factories.BISHR.getFact();
            default : throw new SemanticError("Unexpected binary operation.\n");
        }
    }

    private OpFactory calUni(int op) {
        switch (op) {
            case Symbols.MUL    : return Factories.UNREF.getFact();
            case Symbols.ADRESS : return Factories.UNADR.getFact();
            case Symbols.ADD    : return Factories.UNADD.getFact();
            case Symbols.SUB    : return Factories.UNSUB.getFact();
            case Symbols.TILDE  : return Factories.UNTIL.getFact();
            case Symbols.NOT    : return Factories.UNNOT.getFact();
            case Symbols.INC_OP : return Factories.UNINC.getFact();
            case Symbols.DEC_OP : return Factories.UNDEC.getFact();
            case Symbols.SIZEOF : return Factories.UNSIZ.getFact();
            default : throw new InternalError("Unexpected unary operator.\n");
        }
    }

    private OpFactory calPost(int op) {
        switch (op) {
            case Symbols.INC_OP : return Factories.POINC.getFact();
            case Symbols.DEC_OP : return Factories.PODEC.getFact();
            default : throw new InternalError("Unexpected Post operator.\n");
        }
    }

    void define(int id, Type type) {
        define(id, type, VariableTable.VARIABLE);
    }

    void define(int id, Type type, int isVari) {
        if (table.checkCurId(id)) {
            if (!isGlobal() || !typeEqual(type, table.getId(id)) || table.checkType(id) != isVari) {
                throw new SemanticError("Identifier " + id + " redeclared as a different kind of symbol.\n");
            } else if (table.checkDefi(id)) {
                throw new SemanticError("Identifier " + id + " redefined.\n");
            }
        } else {
            if (isVari == VariableTable.VARIABLE) {
                table.addVari(id, type);
            } else {
                table.addType(id, type);
            }
        }
        table.defiVari(id);
    }

    void declare(int id, Type type) {
        declare(id, type, VariableTable.VARIABLE);
    }

    void declare(int id, Type type, int isVari) {
        if (table.checkCurId(id)) {
            if (!isGlobal() || !typeEqual(type, table.getId(id)) || table.checkType(id) != isVari) {
                throw new SemanticError("Identifier #" + id + " redeclared as a different kind of symbol.\n");
            }
        } else {
            if (isVari == VariableTable.VARIABLE) {
                table.addVari(id, type);
            } else {
                table.addType(id, type);
            }
        }
    }

    private String getString2(Initializer init) {
        if (init instanceof InitList) {
            List<Initializer> list = ((InitList) init).list;
            if (list.size() != 1) {
                return null;
            }
            return getString2(list.get(0));
        } else {
            Expression expr = ((InitValue)init).expr;
            if (expr instanceof StringConst) {
                return ((StringConst)expr).str;
            } else {
                return null;
            }
        }
    }

    private String getString(Initializer init) {
        if (init instanceof InitList) {
            return null;
        } else {
            Expression expr = ((InitValue)init).expr;
            if (expr instanceof StringConst) {
                return ((StringConst)expr).str;
            } else {
                return null;
            }
        }
    }

    void checkInit(Initializer init)  {
        if (init instanceof InitList) {
            List<Initializer> list = ((InitList) init).list;
            for (Initializer init1 : list) {
                checkInit(init1);
            }
        } else {
            ((InitValue)init).expr.accept(this);
            stack.pop();
        }
    }

    LinkedList<Pair> calInit(Type vari, Initializer init, int delta) {
        LinkedList<Pair> ret = new LinkedList<>();

        String s = getString(init);
        if (s == null) {
            if (vari instanceof ArrayType) {
                ArrayType base = (ArrayType) vari;
                if (base.baseType instanceof CharType) {
                    s = getString2(init);
                }
            }
        }
        if (s != null) {
            if (vari instanceof ArrayType) {
                ArrayType base = (ArrayType)vari;
                if (base.baseType instanceof CharType) {
                    if (base.cap == null) {
                        new IntConst(s.length() + 1).accept(this);
                        Expr cap = (Expr)stack.pop();
                        if (!cap.isConst) {
                            throw new SemanticError("The size of an array must be constant.\n");
                        } else {
                            if (!isInt(cap.retType)) {
                                cap = new Expr(getExprList((Expr) (stack.pop())), getList(new IntType()), Factories.CAST.getFact());
                            }
                            Integer num = (Integer)(cap.value);
                            if (num <= 0) {
                                throw new SemanticError("The size of an array must be positive.\n");
                            } else {
                                vari.size = num * base.baseType.size;
                            }
                        }
                    }
                    int size = Math.min(s.length(), base.size / base.baseType.size);
                    for (int i = 0; i < size; ++i) {
                        ret.add(new Pair(delta + i, new Expr(null, getList(s.charAt(i)), Factories.CHAR.getFact())));
                    }
                    if ((base.size / base.baseType.size) > s.length()) {
                        ret.add(new Pair(delta + s.length(), new Expr(null, getList('\0'), Factories.CHAR.getFact())));
                    }
                    return ret;
                }
            } else if (vari instanceof PointerType) {
                Type base = ((PointerType)vari).baseType;
                if (base instanceof CharType) {
                    ret.add(new Pair(delta, new Expr(null, getList(s), Factories.STRING.getFact())));
                    return ret;
                }
            }
        }

        if (vari instanceof ArrayType) {
            ArrayType base = (ArrayType)vari;
            if (init instanceof InitList) {
                List<Initializer> list = ((InitList) init).list;
                if (base.cap == null) {
                    new IntConst(list.size()).accept(this);
                    Expr cap = (Expr)stack.pop();
                    if (!cap.isConst) {
                        throw new SemanticError("The size of an array must be constant.\n");
                    } else {
                        if (!isInt(cap.retType)) {
                            cap = new Expr(getExprList((Expr) (stack.pop())), getList(new IntType()), Factories.CAST.getFact());
                        }
                        Integer num = (Integer)(cap.value);
                        if (num <= 0) {
                            throw new SemanticError("The size of an array must be positive.\n");
                        } else {
                            base.size = num * base.baseType.size;
                        }
                    }
                }
                int delta1 = base.baseType.size;
                for (int i = 0; i < list.size(); ++i) {
                    if (i >= base.size / base.baseType.size) {
                        checkInit(list.get(i));
                    } else {
                        if (base.baseType instanceof ArrayType && list.get(i) instanceof InitValue && getString(list.get(i)) == null) {
                            //TODO this is not very correct
                            ret.addAll(calInit(((ArrayType)(base.baseType)).baseType, init, delta + delta1 * i));
                        } else {
                            ret.addAll(calInit(base.baseType, list.get(i), delta + delta1 * i));
                        }
                    }
                }
            } else {
                throw new SemanticError("An array is improperly initialized.\n");
            }
        } else {
            if (init instanceof InitValue) {
                InitValue val = (InitValue) init;
                val.expr.accept(this);
                Expr expr = (Expr) (stack.pop());
                if (!typeEqual(vari, expr.retType)) {
                    expr = new Expr(getExprList(expr), getList(vari), Factories.CAST.getFact());
                }
                if (isGlobal() && !expr.isConst) {
                    throw new SemanticError("Global initialization must be constant.");
                }
                ret.add(new Pair(delta, expr));
            } else {
                InitList list = (InitList) init;
                if (list.list.size() > 0) {
                    for (int i = 1; i < list.list.size(); ++i) {
                        checkInit(list.list.get(i));
                    }
                    ret = calInit(vari, list.list.get(0), delta);
                } else {
                    throw new SemanticError("Empty initialization list for a certain value.");
                }
            }
        }
        return ret;
    }

    void addScope() {
        table.addScope();
        struct.addScope();
    }

    void delScope() {
        table.delScope();
        struct.delScope();
    }

    boolean isUndim(Type type) {
        return type instanceof ArrayType && ((ArrayType)type).cap == null;
    }

    static public LinkedList<Expr> getExprList(Expr expr) {
        LinkedList<Expr> ret = new LinkedList<>();
        ret.add(expr);
        return ret;
    }

    static public LinkedList<Expr> getExprList(Expr expr1, Expr expr2) {
        LinkedList<Expr> ret = new LinkedList<>();
        ret.add(expr1);
        ret.add(expr2);
        return ret;
    }

    static public LinkedList<Object> getList(Object ob) {
        LinkedList<Object> ret = new LinkedList<>();
        ret.add(ob);
        return ret;
    }

    static public LinkedList<Object> getList(Object ob1, Object ob2) {
        LinkedList<Object> ret = new LinkedList<>();
        ret.add(ob1);
        ret.add(ob2);
        return ret;
    }

    static public boolean isInt(Type type) {
        return type instanceof IntType;
    }

    LinkedList<IRTNode> stack;

    public IRTNode getRoot() {
        return stack.getFirst();
    }

    //endregion


    public void setOutput (OutputStream out) {}

    public void visit(Program p) {
        int pt = stack.size();

        for (Declaration decl : p.list) {
            decl.accept(this);
        }

        LinkedList<IRTNode> tmp = new LinkedList<>();
        while (stack.size() > pt) {
            tmp.add(stack.pop());
        }
        stack.push(new Prog(tmp));
    }

    public void visit(DeclList dl) {
        for (Declaration decl : dl.list) {
            decl.accept(this);
        }
    }

    public void visit(ParaList pl) {
        ++isInPara;
        for (Declaration decl : pl.list) {
            decl.accept(this);
        }
        --isInPara;
    }

    public void visit(FunctionDefi fd) {
        fd.type.accept(this);
        FunctionType type = ((FunctionType)fd.type);
        define(fd.name.num, fd.type);
        addScope();
        ++isInFunc;
        define(Symbol.getnum("#Return"), type.returnType);
        fd.paras.accept(this);
        fd.body.accept(this);
        --isInFunc;
        delScope();

        stack.push(new Func(fd.name.num, type.returnType.size, fd.paras, (CpSt) stack.pop()));
    }

    public void visit(VariableDecl vd) {
        LinkedList<Pair> init = null;

        vd.type.accept(this);
        vd.type = resolve(vd.type);
        Type type = vd.type;
        if (isVoid(type)) {
            throw new SemanticError("Identifier " + vd.name.toString() + " declared as void.\n");
        }
        if (vd.init == null) {
            //Deal with undimensioned array
            if (isUndim(type)) {
                if (isGlobal()) {
                    ArrayType type1 = (ArrayType)type;
                    type1.cap = new IntConst(1);
                    type1.cap.accept(this);
                    type1.size = type1.baseType.size;
                } else if (!isPara()) {
                    throw new SemanticError("Array size undefined.\n");
                }
            }
            if (type instanceof ArrayType && isPara()) {
                vd.type = new PointerType(((ArrayType) type).baseType);
                vd.type.size = 4;
                type = vd.type;
            }
            declare(vd.name.num, type);
        } else {
            if (type instanceof ArrayType && isPara()) {
                vd.type = new PointerType(((ArrayType) type).baseType);
                vd.type.size = 4;
                type = vd.type;
            }
            define(vd.name.num, type);
            init = calInit(vd.type, vd.init, 0);
        }
        if (!isPara()) {
            stack.push(new Decl(vd.name.num, vd.type.size, true, init));
        }
    }

    public void visit(FunctionDecl fd) {
        if (fd.init != null) {
            throw new SemanticError("Function initialized like a variable.\n");
        }
        fd.type.accept(this);
        declare(fd.name.num, fd.type);
    }

    public void visit(TypeDecl td) {
        td.type.accept(this);
        td.type = resolve(td.type);
    }

    public void visit(TypeDef td) {
        td.type.accept(this);
        td.type = resolve(td.type);
        define(td.name.num, td.type, VariableTable.TYPENAME);
    }

    public void visit(InitValue iv) {
        throw new InternalError("The IRTBuilder reached an InitValue.");
    }

    public void visit(InitList il) {
        throw new InternalError("The IRTBuilder reached an InitList.");
    }

    public void visit(ArrayType at) {
        at.baseType.accept(this);
        at.baseType = resolve(at.baseType);
        Type type = at.baseType;
        if (isUndim(type)) {
            throw new SemanticError("Incomplete array type.\n");
        }
        at.baseType.isLeft = true;
        if (at.cap != null) {
            at.cap.accept(this);
            Expr cap = (Expr)stack.pop();
            if (!cap.isConst) {
                throw new SemanticError("The size of an array must be constant.\n");
            } else {
                if (!isInt(cap.retType)) {
                    cap = new Expr(getExprList((Expr)(stack.pop())), getList(new IntType()), Factories.CAST.getFact());
                }
                Integer num = (Integer)(cap.value);
                if (num <= 0) {
                    throw new SemanticError("The size of an array must be positive.\n");
                } else {
                    at.size = at.baseType.size * num;
                }
            }
        } else {
            at.size = 0;
        }
    }

    public void visit(PointerType pt) {
        pt.baseType.accept(this);
        pt.baseType = resolve(pt.baseType);
        pt.baseType.isLeft = true;
        pt.size = 4;
    }

    public void visit(StructType st) {
        st.size = 0;
        if (st.list == null) {
            if (struct.checkId(st.name.num) == 0) {
                throw new SemanticError("Structure name " + st.name.toString() + " undeclared.\n");
            } else {
                if (struct.checkId(st.name.num) == StructureTable.UNION) {
                    throw new SemanticError("Union name " + st.name.toString() + " used as a structure.\n");
                } else {
                    st.mem = ((StructType) struct.getId(st.name.num)).mem;
                    st.size = ((StructType) struct.getId(st.name.num)).size;
                }
            }
        } else {
            if (struct.checkId(st.name.num) != 0) {
                throw new SemanticError("Structure name " + st.name.toString() + " redeclared.\n");
            } else {
                st.mem = new MemberTable();
                struct.addEntry(st.name.num, st, StructureTable.STRUCT);
                for (Declaration decl : st.list.list) {
                    decl.type.accept(this);
                    decl.type = resolve(decl.type);
                    if (isUndim(decl.type)) {
                        if (st.list.list.lastIndexOf(decl) == st.list.list.size() - 1) {
                            ArrayType type = (ArrayType)decl.type;
                            type.size = 0;
                        } else {
                            throw new SemanticError("Incomplete array type in a structure.\n");
                        }
                    }
                    decl.type.isLeft = true;
                    if (st.mem.checkId(decl.name.num)) {
                        throw new SemanticError("Structure field " + decl.name.toString() + " redeclared.\n");
                    } else {
                        st.mem.addEntry(decl.name.num, decl.type, st.size);
                    }
                    //TODO : space patch bug!
                    st.size += decl.type.size;
                }
                if (st.size % 4 != 0) {
                    st.size += 4 - st.size % 4;
                }
            }
        }
    }

    public void visit(UnionType ut) {
        ut.size = 0;
        if (ut.list == null) {
            if (struct.checkId(ut.name.num) == 0) {
                throw new SemanticError("Union name " + ut.name.toString() + " undeclared.\n");
            } else {
                if (struct.checkId(ut.name.num) == StructureTable.STRUCT) {
                    throw new SemanticError("Structure name " + ut.name.toString() + " used as a union.\n");
                } else {
                    ut.mem = ((UnionType) struct.getId(ut.name.num)).mem;
                    ut.size = ((UnionType) struct.getId(ut.name.num)).size;
                }
            }
        } else {
            if (struct.checkId(ut.name.num) != 0) {
                throw new SemanticError("Union name " + ut.name.toString() + " redefined.\n");
            } else {
                ut.mem = new MemberTable();
                struct.addEntry(ut.name.num, ut, StructureTable.UNION);
                for (Declaration decl : ut.list.list) {
                    decl.type.accept(this);
                    decl.type = resolve(decl.type);
                    if (isUndim(decl.type)) {
                        throw new SemanticError("Incomplete array type in a union.\n");
                    }
                    decl.type.isLeft = true;
                    if (ut.mem.checkId(decl.name.num)) {
                        throw new SemanticError("Union field " + decl.name.toString() + " redeclared.\n");
                    } else {
                        ut.mem.addEntry(decl.name.num, decl.type, 0);
                    }
                    ut.size = Integer.max(ut.size, decl.type.size);
                }
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

    DefinedType lastType = null;

    public void visit(DefinedType dt) {
        if (!table.checkId(dt.name.num)) {
            throw new SemanticError("Defined type " + dt.name.toString() + " undeclared.\n");
        } else {
            if (table.checkType(dt.name.num) != VariableTable.TYPENAME) {
                if (dt.equals(lastType)) {
                    return;
                } else {
                    throw new SemanticError("Defined type " + dt.name.toString() + " is not a type.\n");
                }
            } else {
                dt.baseType = table.getId(dt.name.num);
                dt.size = dt.baseType.size;
            }
            lastType = dt;
        }
    }

    public void visit(FunctionType ft) {
        ft.returnType.accept(this);
        if (ft.returnType instanceof ArrayType) {
            throw new SemanticError("Function returns an array.\n");
        }
        ft.returnType = resolve(ft.returnType);
        LinkedList<Type> tmp = new LinkedList<Type>();
        for (Type type : ft.paraType) {
            type.accept(this);
            tmp.add(resolve(type));
        }
        ft.paraType = tmp;
        ft.size = 4;
    }

    public void visit(StatList sl) {
        for (Statement stat : sl.list) {
            if (stat instanceof CompoundStat) {
                addScope();
            }
            stat.accept(this);
            if (stat instanceof CompoundStat) {
                delScope();
            }
        }
    }

    public void visit(ExpressionStat es) {
        es.expr.accept(this);
        stack.push(new ExSt((Expr)(stack.pop())));
    }

    public void visit(CompoundStat cs) {
        int pt = stack.size();

        cs.dlst.accept(this);
        cs.slst.accept(this);

        LinkedList<IRTNode> tmp = new LinkedList<>();
        while (stack.size() > pt) {
            tmp.push(stack.pop());
        }
        stack.push(new CpSt(tmp));
    }

    public void visit(SelectionStat ss) {
        ss.expr.accept(this);
        Expr expr = (Expr)stack.pop();
        if (!isInt(expr.retType)) {
            expr = new Expr(getExprList(expr), getList(new IntType()), Factories.CAST.getFact());
        }
        Stat tr, fl;
        addScope();
        ss.iftr.accept(this);
        delScope();
        tr = (Stat)(stack.pop());
        addScope();
        ss.iffl.accept(this);
        delScope();
        fl = (Stat)(stack.pop());
        stack.push(new SeSt(expr, tr, fl));
    }

    public void visit(IterationStat is) {
        Expr init, expr, inct;
        Stat stat;
        is.init.accept(this);
        init = (Expr)(stack.pop());
        is.expr.accept(this);
        expr = (Expr)(stack.pop());
        if (!isInt(expr.retType)) {
            expr = new Expr(getExprList(expr), getList(new IntType()), Factories.CAST.getFact());
        }
        is.inct.accept(this);
        inct = (Expr)(stack.pop());
        addScope();
        isInLoop++;
        is.stat.accept(this);
        isInLoop--;
        delScope();
        stat = (Stat)stack.pop();
        stack.push(new ItSt(new ExSt(init), expr, stat, new ExSt(inct)));
    }

    public void visit(ContinueStat cs) {
        if (!hasLoop()) {
            throw new SemanticError("Continue must be in a loop.\n");
        } else {
            stack.push(new JpSt(JpSt.CONTINUE));
        }
    }

    public void visit(BreakStat bs) {
        if (!hasLoop()) {
            throw new SemanticError("Break must be in a loop.\n");
        } else {
            stack.push(new JpSt(JpSt.BREAK));
        }
    }

    public void visit(ReturnStat rs) {
        if (rs.expr.isEmpty())  {
            if (!isVoid(table.getId(Symbol.getnum("#Return")))) {
                throw new SemanticError("Return type doesn't match function return type.\n");
            }
            stack.push(new JpSt(JpSt.RETURN));
        } else {
            LinkedList<IRTNode> tmp = new LinkedList<IRTNode>();
            rs.expr.accept(this);
            Expr expr = (Expr)(stack.pop());
            int retVari = Symbol.getnum("#Return");
            Type retType = table.getId(retVari);
            if (!typeEqual(expr.retType, retType)) {
                expr = new Expr(getExprList(expr), getList(retType), Factories.CAST.getFact());
            }
            Expr expr1 = new Expr(null, getList(retVari, retType), Factories.VARI.getFact());
            expr = new Expr(getExprList(expr1, expr), null, Factories.ASSIGN.getFact());
            tmp.add(new ExSt(expr));
            tmp.add(new JpSt(JpSt.RETURN));
            stack.push(new CpSt(tmp));
        }
    }

    public void visit(EmptyExpr ee) {
        stack.push(new Expr(null, null, Factories.EMPTY.getFact()));
    }

    public void visit(ArgumentList al) {
        for (Expression expr : al.list) {
            expr.accept(this);
        }
    }

    public void visit(BinaryExpr be) {
        Expr expr1, expr2;
        be.expr1.accept(this);
        expr1 = (Expr)stack.pop();
        be.expr2.accept(this);
        expr2 = (Expr)stack.pop();
        stack.push(new Expr(getExprList(expr1, expr2), null, calBin(be.op)));
    }

    public void visit(CastExpr ce) {
        Expr expr;
        ce.expr.accept(this);
        expr = (Expr)(stack.pop());
        ce.type.accept(this);
        ce.type = resolve(ce.type);
        stack.push(new Expr(getExprList(expr), getList(ce.type), Factories.CAST.getFact()));
    }

    public void visit(UnaryExpr ue) {
        ue.expr.accept(this);
        stack.push(new Expr(getExprList((Expr)(stack.pop())), null, calUni(ue.op)));
    }

    public void visit(SizeofExpr se) {
        se.type.accept(this);
        stack.push(new Expr(null, getList(se.type.size), Factories.INT.getFact()));
    }

    public void visit(FunctionCall fc) {
        fc.func.accept(this);
        Expr func = (Expr)(stack.pop());
        int pt = stack.size();
        LinkedList<Expr> argu = new LinkedList<>();
        fc.argu.accept(this);
        while (stack.size() > pt) {
            argu.push((Expr)(stack.pop()));
        }
        argu.push(func);
        stack.push(new Expr(argu, null, Factories.CALL.getFact()));
    }

    public void visit(ArrayExpr ar) {
        Expr expr, addr;
        ar.expr.accept(this);
        expr = (Expr)stack.pop();
        ar.addr.accept(this);
        addr = (Expr)stack.pop();
        stack.push(new Expr(getExprList(expr, addr), null, Factories.ARRAY.getFact()));
    }

    public void visit(PointerAccess pa) {
        pa.expr.accept(this);
        stack.push(new Expr(getExprList((Expr)(stack.pop())), getList(pa.id.num), Factories.POINT.getFact()));
    }

    public void visit(RecordAccess ra) {
        ra.expr.accept(this);
        stack.push(new Expr(getExprList((Expr)(stack.pop())), getList(ra.id.num), Factories.RECORD.getFact()));
    }

    public void visit(PostExpr pe) {
        pe.expr.accept(this);
        stack.push(new Expr(getExprList((Expr)(stack.pop())), null, calPost(pe.op)));
    }

    public void visit(Variable v) {
        if (!table.checkId(v.id.num)) {
            throw new SemanticError("Identifier " + v.id.toString() + " undeclared.\n");
        } else {
            if (table.checkType(v.id.num) == VariableTable.TYPENAME) {
                throw new SemanticError("Typename " + v.id.toString() + " used as variable.\n");
            } else {
                stack.push(new Expr(null, getList(v.id.num, table.getId(v.id.num)), Factories.VARI.getFact()));
            }
        }
    }

    public void visit(IntConst ic) {
        stack.push(new Expr(null, getList(ic.val), Factories.INT.getFact()));
    }

    public void visit(CharConst cc) {
        stack.push(new Expr(null, getList(cc.ch), Factories.CHAR.getFact()));
    }

    public void visit(StringConst sc) {
        stack.push(new Expr(null, getList(sc.str), Factories.STRING.getFact()));
    }

    public void visit(Symbol s) {
    }

}

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
import parser.Symbols;
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

//TODO : undimensioned array
//TODO : struct name *p;

public class SemanticCheck implements Visitor {

    private VariableTable table;
    private StructureTable struct;
    int isInPara = 0;

    private void debug(Visible item) {
        Visitor v = new PrintAST();
        OutputStream out = new ByteArrayOutputStream();
        v.setOutput(out);
        item.accept(v);
        System.out.print(out.toString());
    }

    public SemanticCheck() {
        Symbol.reset();
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

    private boolean isGlobal() {
        return funcStack.size() > 0;
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

    private boolean isVoid(Type type) {
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

    private boolean isVoidPointer(Type a) {
        return a instanceof PointerType && !(a instanceof ArrayType) && ((PointerType)a).baseType instanceof VoidType;
    }

    private boolean typeEqual(Type a, Type b) {
        if (a instanceof PointerType && isVoidPointer(b) || b instanceof PointerType && isVoidPointer(a)) {
            return true;
        }
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
            throw new SemanticError("Unexpected type error.\n");
        }
    }

    private boolean typeCheck(Type being, Type tobe) {
        return typeEqual(being, tobe) || (typeEqual(being, new CharType()) && typeEqual(tobe, new IntType()))
                                      || (typeEqual(being, new IntType()) && typeEqual(tobe, new CharType()));
    }

    private int isString(Initializer init) {
        if (init instanceof InitList) {
            return 0;
        } else {
            Expression expr = ((InitValue)init).expr;
            if (expr instanceof StringConst) {
                return ((StringConst)expr).str.length();
            } else {
                return 0;
            }
        }
    }

    private void initCheck(Type vari, Initializer init) {
        int len = isString(init);
        if (len > 0) {
            if (vari instanceof ArrayType) {
                ArrayType base = (ArrayType)vari;
                if (base.baseType instanceof CharType) {
                    if (base.cap == null) {
                        base.cap = new IntConst(len + 1);
                        base.cap.accept(this);
                        base.size = (Integer)base.cap.retType.value * base.baseType.size;
                    }
                }
            }
        }
        if (vari instanceof ArrayType) {
            ArrayType base = (ArrayType)vari;
            if (init instanceof InitList) {
                List<Initializer> list =((InitList) init).list;
                if (base.cap == null) {
                    base.cap = new IntConst(list.size());
                    base.cap.accept(this);
                    base.size = (Integer)base.cap.retType.value * base.baseType.size;
                } else {
                    if ((Integer)(base.cap.retType.value) < list.size()) {
                        throw new SemanticError("Initializer is too long.\n");
                    }
                }
                for (Initializer it : list) {
                    initCheck(base.baseType, it);
                }
            } else {
                throw new SemanticError("An array is improperly initialized.\n");
            }
        } else {
            InitValue val = (InitValue)init;
            calBin(Symbols.ASSIGN, vari, val.expr.retType);
        }
    }

    private boolean undimCheck(Type type) {
        return type instanceof ArrayType && ((ArrayType)type).cap == null;
    }

    private boolean isNum(Type type) {
        return typeEqual(type, new IntType()) || typeEqual(type, new CharType());
    }

    private Integer getNum(Type type) {
        if (typeEqual(type, new IntType())) {
            return (Integer)type.value;
        } else {
            return (int)((Character)type.value);
        }
    }

    private Object calCast(Integer it, Type type) {
        if (typeEqual(type, new IntType())) {
            return it;
        } else {
            return (char)(it & 255);
        }
    }

    private Type calBin(int op, Type type1, Type type2) {
        Type ret = null;
        String s = Symbols.terminalNames[op].intern();
        if (op == Symbols.COMMA) {
            ret = type2.clone();
            ret.isLeft = false;
        } else if (op == Symbols.ASSIGN) {
            if (!type1.isLeft) {
                throw new SemanticError("The assignment must have a left value on the left side.\n");
            } else {
                if (!typeCheck(type1, type2)) {
                    if (type1 instanceof PointerType && isNum(type2)) {
                        ret = type1.clone();
                    } else {
                        throw new SemanticError("The left and right value of an assignment must be of the same type.\n");
                    }
                } else {
                    ret = type1.clone();
                }
            }
        } else if (op == Symbols.MUL_ASSIGN
                || op == Symbols.DIV_ASSIGN
                || op == Symbols.MOD_ASSIGN
                || op == Symbols.ADD_ASSIGN
                || op == Symbols.SUB_ASSIGN
                || op == Symbols.SHL_ASSIGN
                || op == Symbols.SHR_ASSIGN
                || op == Symbols.XOR_ASSIGN
                || op == Symbols.OR_ASSIGN
                || op == Symbols.AND_ASSIGN) {
            switch (s) {
                case "MUL_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.MUL, type1, type2));
                    break;
                }
                case "DIV_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.DIV, type1, type2));
                    break;
                }
                case "MOD_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.MOD, type1, type2));
                    break;
                }
                case "ADD_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.ADD, type1, type2));
                    break;
                }
                case "SUB_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.SUB, type1, type2));
                    break;
                }
                case "SHL_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.SHL_OP, type1, type2));
                    break;
                }
                case "SHR_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.SHR_OP, type1, type2));
                    break;
                }
                case "XOR_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.XOR, type1, type2));
                    break;
                }
                case "OR_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.OR, type1, type2));
                    break;
                }
                case "AND_ASSIGN": {
                    ret = calBin(Symbols.ASSIGN, type1, calBin(Symbols.ADRESS, type1, type2));
                    break;
                }
            }
        } else if (op == Symbols.ADD) {
            if (!isNum(type1) && !(type1 instanceof PointerType)) {
                throw new SemanticError("The left operand of " + s + "must be int, char or a pointer.\n");
            } else {
                if (!isNum(type2)) {
                    throw new SemanticError("The right operand of " + s + " must be int or char.\n");
                } else {
                    if (type1 instanceof PointerType) {
                        ret = type1.clone();
                        ret.isLeft = false;
                    } else {
                        ret = new IntType();
                        ret.size = 4;
                        ret.isLeft = false;
                        if (type1.isConst && type2.isConst) {
                            ret.isConst = true;
                            ret.value = getNum(type1) + getNum(type2);
                        }
                    }
                }
            }
        } else if (op == Symbols.SUB) {
            if (!isNum(type1) && !(type1 instanceof PointerType)) {
                throw new SemanticError("The left operand of " + s + "must be int, char or a pointer.\n");
            } else {
                if (!isNum(type2) && !(type2 instanceof PointerType)) {
                    throw new SemanticError("The right operand of " + s + " must be int or char or a pointer.\n");
                } else {
                    if (type1 instanceof PointerType) {
                        if (type2 instanceof PointerType) {
                            if (!typeEqual(type1, type2)) {
                                throw new SemanticError("Invalid operands to binary -.\n");
                            } else {
                                ret = new IntType();
                                ret.size = 4;
                                ret.isLeft = false;
                            }
                        } else {
                            ret = type1.clone();
                            ret.isLeft = false;
                        }
                    } else {
                        ret = new IntType();
                        ret.size = 4;
                        ret.isLeft = false;
                        if (type1.isConst && type2.isConst) {
                            ret.isConst = true;
                            ret.value = getNum(type1) - getNum(type2);
                        }
                    }
                }
            }
        } else if (op == Symbols.EQ_OP || op == Symbols.NE_OP) {
            if (!isNum(type1) && !(type1 instanceof PointerType)) {
                throw new SemanticError("The left operand of " + s + " must be int, char or a pointer.\n");
            } else {
                if (!isNum(type2) && !(type2 instanceof PointerType)) {
                    throw new SemanticError("The right operand of " + s + " must be int, char or a pointer.\n");
                } else {
                    ret = new IntType();
                    ret.size = 4;
                    ret.isLeft = false;
                    if (isNum(type1) && isNum(type2) && type1.isConst && type2.isConst) {
                        ret.isConst = true;
                        ret.value = op == Symbols.EQ_OP ? getNum(type1).equals(getNum(type2)) : !getNum(type1).equals(getNum(type2));
                    }
                }
            }
        } else if (op == Symbols.MUL
                || op == Symbols.OR
                || op == Symbols.XOR
                || op == Symbols.ADRESS
                || op == Symbols.LESS
                || op == Symbols.GREATER
                || op == Symbols.DIV
                || op == Symbols.MOD
                || op == Symbols.OR_OP
                || op == Symbols.AND_OP
                || op == Symbols.LE_OP
                || op == Symbols.GE_OP
                || op == Symbols.SHL_OP
                || op == Symbols.SHR_OP) {
            if (!isNum(type1) || !isNum(type2)) {
                throw new SemanticError("The left and right operand of " + s + " must be of int or char.\n");
            } else {
                ret = new IntType();
                ret.size = 4;
                ret.isLeft = false;
                if (isNum(type1) && type1.isConst && type2.isConst) {
                    ret.isConst = true;
                    int lv = getNum(type1), rv = getNum(type2);
                    switch (s) {
                        case "MUL": {
                            ret.value = lv * rv;
                            break;
                        }
                        case "OR": {
                            ret.value = lv | rv;
                            break;
                        }
                        case "XOR": {
                            ret.value = lv ^ rv;
                            break;
                        }
                        case "ADRESS": {
                            ret.value = lv & rv;
                            break;
                        }
                        case "LESS": {
                            ret.value = lv < rv ? 1 : 0;
                            break;
                        }
                        case "GREATER": {
                            ret.value = lv > rv ? 1 : 0;
                            break;
                        }
                        case "DIV": {
                            if (rv != 0) {
                                ret.value = lv / rv;
                            }
                            break;
                        }
                        case "MOD": {
                            if (rv != 0) {
                                ret.value = lv % rv;
                            }
                            break;
                        }
                        case "OR_OP": {
                            ret.value = lv != 0 || rv != 0 ? 1 : 0;
                            break;
                        }
                        case "AND_OP": {
                            ret.value = lv != 0 && rv != 0 ? 1 : 0;
                            break;
                        }
                        case "LE_OP": {
                            ret.value = lv <= rv ? 1 : 0;
                            break;
                        }
                        case "GE_OP": {
                            ret.value = lv >= rv ? 1 : 0;
                            break;
                        }
                        case "SHL_OP": {
                            ret.value = lv << rv;
                            break;
                        }
                        case "SHR_OP": {
                            ret.value = lv >> rv;
                            break;
                        }
                    }
                }
            }
        } else {
            throw new SemanticError("Unexpected binary operation : " + s + " .\n");
        }
        return ret;
    }

    private Type calUnary(int op, Type type) {
        Type ret = null;
        String s = Symbols.terminalNames[op].intern();
        if (op == Symbols.MUL) {
            if (!(type instanceof PointerType)) {
                throw new SemanticError("The " + s + " operator requires a PointerType.\n");
            } else {
                if (isVoid(((PointerType)type).baseType)) {
                    throw new SemanticError("Cannot redeference a pointer to void type.\n");
                } else {
                    ret = ((PointerType) type).baseType.clone();
                }
            }
        } else if (op == Symbols.ADRESS) {
            if (!type.isLeft) {
                throw new SemanticError("The " + s + " operator requires a left value.\n");
            } else {
                ret = new PointerType(type);
                ret.size = 4;
                ret.isLeft = false;
            }
        } else if (op == Symbols.ADD || op == Symbols.SUB || op == Symbols.TILDE || op == Symbols.NOT) {
            if (!isNum(type)) {
                throw new SemanticError("The " + s + " operator requires an int or char.\n");
            } else {
                ret = type.clone();
                ret.isLeft = false;
                if (ret.isConst) {
                    switch (s) {
                        case "ADD": {
                            break;
                        }
                        case "SUB": {
                            ret.value = calCast(-getNum(ret), ret);
                            break;
                        }
                        case "NOT": {
                            ret.value = calCast(getNum(ret) == 0 ? 1 : 0, ret);
                            break;
                        }
                        case "TILDE": {
                            ret.value = calCast(~getNum(ret), ret);
                            break;
                        }
                    }
                }
            }
        } else if (op == Symbols.INC_OP || op == Symbols.DEC_OP) {
            if (!type.isLeft) {
                throw new SemanticError("The " + s + " unary expression must have a left value.\n");
            } else {
                if (typeEqual(type, new IntType()) || typeEqual(type, new CharType()) || type instanceof PointerType) {
                    ret = type.clone();
                    ret.isLeft = false;
                } else {
                    throw new SemanticError("The " + s + " operator only supports int, char or a Pointer.\n");
                }
            }
        } else if (op == Symbols.SIZEOF) {
            ret = new IntType();
            ret.size = 4;
            ret.isLeft = false;
            ret.isConst = true;
            ret.value = type.size;
        } else {
            throw new SemanticError("Unexpected Unary operator : " + s + " .\n");
        }
        return ret;
    }

    private Type calPost(int op, Type type) {
        Type ret = null;
        String s = Symbols.terminalNames[op].intern();
        if (op == Symbols.INC_OP || op == Symbols.DEC_OP) {
            if (!type.isLeft) {
                throw new SemanticError("The " + s + " post expression must have a left value.\n");
            } else {
                if (typeEqual(type, new IntType()) || typeEqual(type, new CharType()) || type instanceof PointerType) {
                    ret = type.clone();
                    ret.isLeft = false;
                } else {
                    throw new SemanticError("The " + s + " operator only supports int, char or a Pointer.\n");
                }
            }
        } else {
            throw new SemanticError("Unexpected post expression operator : " + s + " .\n");
        }
        return ret;
    }

    private boolean callCheck(FunctionType func, List<Type> para) {
        int i = 0, j = 0;
        while (i < func.paraType.size() || j < para.size()) {
            if (i == func.paraType.size()) {
                return false;
            }
            if (j == para.size() && !(func.paraType.get(i) instanceof ELLIPSIS)) {
                return false;
            }
            if (func.paraType.get(i) instanceof ELLIPSIS) {
                if (j < para.size()) {
                    ++j;
                } else {
                    ++i;
                }
            } else if (typeEqual(func.paraType.get(i), para.get(j))) {
                ++i;
                ++j;
            } else {
                return false;
            }
        }
        return true;
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
        ++isInPara;
        for (Declaration decl : pl.list) {
            decl.accept(this);
        }
        --isInPara;
    }

    public void visit(FunctionDefi fd) {
        fd.type.accept(this);
        if (table.checkCurId(fd.name.num)) {
            if (!typeEqual(fd.type, table.getId(fd.name.num)) || isVoidPointer(fd.type) != isVoidPointer(table.getId(fd.name.num))) {
                throw new SemanticError("Identifier " + fd.name.toString() + " redeclared as a different kind of symbol.\n");
            } else if (table.checkDefi(fd.name.num)) {
                throw new SemanticError("Identifier " + fd.name.toString() + " redefined.\n");
            }
        } else {
            table.addVari(fd.name.num, fd.type);
        }
        table.defiVari(fd.name.num);
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
        if (vd.init != null) {
            vd.init.accept(this);
        }
        vd.type.accept(this);
        vd.type = resolve(vd.type);
        initCheck(vd.type, vd.init);
        if (undimCheck(vd.type)) {
            if (funcStack.size() == 0) {
                ArrayType base = ((ArrayType)vd.type);
                base.cap = new IntConst(1);
                base.cap.accept(this);
                base.size = base.baseType.size * (Integer)base.cap.retType.value;
            } else {
                if (isInPara > 0) {
                    vd.type = new PointerType(((ArrayType)vd.type).baseType);
                    vd.type.size = 4;
                    vd.type.isConst = false;
                    vd.type.isLeft = false;
                } else {
                    throw new SemanticError("Array size undefined.\n");
                }
            }
        }
        if (isVoid(vd.type)) {
            throw new SemanticError("Identifier " + vd.name.toString() + " declared as void.\n");
        }
        if (table.checkCurId(vd.name.num)) {
            if (!isGlobal() || !typeEqual(vd.type, table.getId(vd.name.num)) || isVoidPointer(vd.type) != isVoidPointer(table.getId(vd.name.num))) {
                throw new SemanticError("Identifier " + vd.name.toString() + " redeclared as a different kind of symbol.\n");
            } else if (vd.init != null && table.checkDefi(vd.name.num)) {
                throw new SemanticError("Identifier " + vd.name.toString() + " redefined.\n");
            }
        } else {
            table.addVari(vd.name.num, vd.type);
            if (vd.init != null) {
                table.defiVari(vd.name.num);
            }
        }
    }

    public void visit(FunctionDecl fd) {
        if (fd.init != null) {
            throw new SemanticError("Function initialized like a variable.\n");
        }
        fd.type.accept(this);
        if (table.checkCurId(fd.name.num)) {
            if (!isGlobal() || typeEqual(fd.type, table.getId(fd.name.num)) || isVoidPointer(fd.type) != isVoidPointer(table.getId(fd.name.num))) {
                throw new SemanticError("Identifier " + fd.name.toString() + " redeclared as a different kind of symbol.\n");
            }
        } else {
            table.addVari(fd.name.num, fd.type);
        }
    }

    public void visit(TypeDecl td) {
        td.type.accept(this);
        td.type = resolve(td.type);
    }

    public void visit(TypeDef td) {
        td.type.accept(this);
        td.type = resolve(td.type);
        if (table.checkCurId(td.name.num)) {
            throw new SemanticError("Identifier " + td.name.toString() + " redeclared as a different kind of symbol.\n");
        } else {
            table.addType(td.name.num, td.type);
        }
    }

    public void visit(InitValue iv) {
        iv.expr.accept(this);
        if (this.funcStack.size() == 0 && !iv.expr.retType.isConst) {
            throw new SemanticError("Return value of a global initializer must be a constant.");
        }
    }

    public void visit(InitList il) {
        for (Initializer it : il.list) {
            it.accept(this);
        }
    }

    public void visit(ArrayType at) {
        at.baseType.accept(this);
        at.baseType = resolve(at.baseType);
        if (undimCheck(at.baseType)) {
            throw new SemanticError("Incomplete array type.\n");
        }
        at.baseType.isLeft = true;
        if (at.cap != null) {
            at.cap.accept(this);
            if (!at.cap.retType.isConst) {
                throw new SemanticError("The size of an array must be constant.\n");
            } else {
                if (!typeCheck(at.cap.retType, new IntType())) {
                    throw new SemanticError("The size of an array must be an integer.\n");
                } else {
                    Integer num = getNum(at.cap.retType);
                    if (num <= 0) {
                        throw new SemanticError("The size of an array must be positive.\n");
                    } else {
                        at.size = at.baseType.size * num;
                    }
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
                    decl.type.isLeft = true;
                    if (st.mem.checkId(decl.name.num)) {
                        throw new SemanticError("Structure field " + decl.name.toString() + " redeclared.\n");
                    } else {
                        st.mem.addEntry(decl.name.num, decl.type);
                    }
                    st.size += decl.type.size;
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
                    decl.type.isLeft = true;
                    if (ut.mem.checkId(decl.name.num)) {
                        throw new SemanticError("Union field " + decl.name.toString() + " redeclared.\n");
                    } else {
                        ut.mem.addEntry(decl.name.num, decl.type);
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

    public void visit(DefinedType dt) {
        if (!table.checkId(dt.name.num)) {
            throw new SemanticError("Defined type " + dt.name.toString() + " undeclared.\n");
        } else {
            if (table.checkType(dt.name.num) != VariableTable.TYPENAME) {
                throw new SemanticError("Defined type " + dt.name.toString() + " is not a type.\n");
            } else {
                dt.baseType = table.getId(dt.name.num).clone();
                dt.size = dt.baseType.size;
            }
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
            tmp.add(type);
        }
        ft.paraType = tmp;
        ft.size = 4;
    }

    public void visit(StatList sl) {
        for (Statement stat : sl.list) {
            if (stat instanceof CompoundStat) {
                table.addScope();
                struct.addScope();
            }
            stat.accept(this);
            if (stat instanceof CompoundStat) {
                table.delScope();
                struct.delScope();
            }
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
            throw new SemanticError("Selection expression return type must be int or char.\n");
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
            throw new SemanticError("Iteration expression return type must be int or char.\n");
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
            throw new SemanticError("Continue must be in a loop.\n");
        } else {
            cs.target = topLoop();
        }
    }

    public void visit(BreakStat bs) {
        if (!hasLoop()) {
            throw new SemanticError("Break must be in a loop.\n");
        } else {
            bs.target = topLoop();
        }
    }

    public void visit(ReturnStat rs) {
        rs.expr.accept(this);
        if (!typeCheck(rs.expr.retType, topFunc().returnType)) {
            throw new SemanticError("Return type doesn't match function return type.\n");
        }
    }

    public void visit(EmptyExpr ee) {
        ee.retType = new IntType();
        ee.retType.isConst = true;
        ee.retType.isLeft = false;
        ee.retType.size = 0;
        ee.retType.value = 1;
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
        ce.type.accept(this);
        ce.type = resolve(ce.type);
        if (isVoid(ce.type)) {
            throw new SemanticError("Can't cast any value to void.\n");
        }
        ce.expr.accept(this);
        if (!typeCheck(ce.expr.retType, ce.type)) {
            throw new SemanticError("Typecast error.\n");
        }
        ce.retType = ce.type.clone();
        ce.retType.isLeft = false;
        if (ce.expr.retType.isConst) {
            if (isNum(ce.expr.retType) && isNum(ce.retType)) {
                ce.retType.isConst = true;
                ce.retType.value = calCast(getNum(ce.expr.retType), ce.retType);
            }
        }
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
        if (!(fc.func.retType instanceof FunctionType)) {
            throw new SemanticError("Function call error. Expression return type is not a function.\n");
        } else {
            if (!callCheck((FunctionType)fc.func.retType, fc.argu.typeList)) {
                throw new SemanticError("Function call error. Function parameters doesn't match. \n");
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
            throw new SemanticError("Array subscript error. Must be int or char.\n");
        } else {
            if (!(ar.expr.retType instanceof PointerType)) {
                throw new SemanticError("Array or pointer expected.\n");
            } else {
                ar.retType = ((PointerType)ar.expr.retType).baseType.clone();
                ar.retType.isConst = false;
                ar.retType.isLeft = true;
            }
        }
    }

    public void visit(PointerAccess pa) {
        pa.expr.accept(this);
        if (!(pa.expr.retType instanceof PointerType)) {
            throw new SemanticError("Pointer type excepted.\n");
        } else {
            Type type = ((PointerType)pa.expr.retType).baseType;
            if (!(type instanceof RecordType)) {
                throw new SemanticError("Record type expected.\n");
            } else{
                RecordType reco = (RecordType)type;
                if (!reco.mem.checkId(pa.id.num)) {
                    throw new SemanticError("Field name " + pa.id.toString() + " not found.\n");
                } else {
                    pa.retType = reco.mem.getId(pa.id.num).clone();
                    pa.retType.isConst = false;
                    pa.retType.isLeft = true;
                }
            }
        }
    }

    public void visit(RecordAccess ra) {
        ra.expr.accept(this);
        Type type = ra.expr.retType;
        if (!(type instanceof RecordType)) {
            throw new SemanticError("Record type expected.\n");
        } else{
            RecordType reco = (RecordType)type;
            if (!reco.mem.checkId(ra.id.num)) {
                throw new SemanticError("Field name " + ra.id.toString() + " not found.\n");
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
            throw new SemanticError("Identifier " + v.id.toString() + " undeclared.\n");
        } else {
            if (table.checkType(v.id.num) == VariableTable.TYPENAME) {
                throw new SemanticError("Typename " + v.id.toString() + " used as variable.\n");
            } else {
                v.retType = table.getId(v.id.num).clone();
                v.retType.isConst = false;
                if (v.retType instanceof ArrayType) {
                    v.retType.isLeft = false;
                } else {
                    v.retType.isLeft = true;
                }
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
        sc.retType.isConst = true;
        sc.retType.isLeft = false;
        sc.retType.size = 4;
        sc.retType.value = sc.str;
    }

    public void visit(Symbol s) {
    }

}

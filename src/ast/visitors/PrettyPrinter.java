package ast.visitors;

import ast.nodes.declaration.*;
import ast.nodes.expression.*;
import ast.nodes.initialization.InitList;
import ast.nodes.initialization.InitValue;
import ast.nodes.initialization.Initializer;
import ast.nodes.declaration.FunctionDefi;
import ast.nodes.Program;
import ast.nodes.statment.*;
import ast.nodes.type.*;
import parser.SymbolsRev;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

/**
 * Created by Robbin Ni on 2015/4/11.
 */
public class PrettyPrinter implements Visitor {

    int indent;
    Integer lastPre;
    ArrayList<String> stack;
    OutputStream out;

    public PrettyPrinter() {
        indent = 0;
        lastPre = 15;
        stack = new ArrayList<String>();
    }

    private void push(String str) {
        stack.add(str);
    }

    private String pop() {
        String ret = stack.get(stack.size() - 1);
        stack.remove(stack.size() - 1);
        return ret;
    }

    private String popTo(int target) {
        String ret = "";
        while (stack.size() > target) {
            ret = pop() + ret;
        }
        return ret;
    }

    private String cover(String str, Type shell) {
        if (shell == null) {
            lastPre = 15;
            return str;
        } else {
            str = cover(str, ((TypeDeco)shell).baseType);
            if (shell.getClass().getName().intern() == "ast.nodes.type.ArrayType") {
                ArrayType tmp = (ArrayType)shell;
                int cur = stack.size();
                tmp.cap.accept(this);
                String cap = popTo(cur);
                if (lastPre < 13) {
                    lastPre = 13;
                    return "(" + str + ")" + "[" + cap + "]";
                } else {
                    return str + "[" + cap + "]";
                }
            } else {
                lastPre = 12;
                return "*" + str;
            }
        }
    }

    private void pushSpace() {
        push(" ");
    }

    private void pushLine() {
        push("\n");
    }

    public void setOutput (OutputStream out) {
        this.out = out;
    }

    private void print() {
        boolean newLine = false;
        for (String str : stack) {
            if (str == "}") {
                --indent;
            } else if (newLine && indent > 0) {
                try {
                    out.write("\t".getBytes());
                } catch (IOException e) {
                    System.out.println("Unexpected IOException.");
                    e.printStackTrace();
                }
            }
            newLine = false;
            try {
                out.write(str.getBytes());
            } catch (IOException e) {
                System.out.println("Unexpected IOException.");
                e.printStackTrace();
            }
            if (str == "{") {
                ++indent;
            }
            if (str == "\n") {
                newLine = true;
                for (int i = 0; i < indent - 1; ++i) {
                    try {
                        out.write("\t".getBytes());
                    } catch (IOException e) {
                        System.out.println("Unexpected IOException.");
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    public void visit(Program p) {
        for (Declaration decl : p.list) {
            decl.accept(this);
            if (decl.getClass().getName().intern() != "ast.nodes.declaration.FunctionDefi") {
                push(";");
            }
            pushLine();
            pushLine();
        }
        print();
    }

    public void visit(ParaList pl) {
        int i = 0;
        for (Declaration decl : pl.list) {
            ++i;
            decl.accept(this);
            if (i != pl.list.size()) {
                push(",");
                pushSpace();
            }
        }
    }

    public void visit(DeclList dl) {
        for (Declaration decl : dl.list) {
            decl.accept(this);
            push(";");
            pushLine();
        }
    }

    public void visit(FunctionDefi fd) {
        fd.returnType.accept(this);
        pushSpace();
        Type shell = fd.returnType.getShell();
        int cur = stack.size();
        fd.name.accept(this);
        push(cover(popTo(cur), shell));
        push("(");
        fd.paras.accept(this);
        push(")");
        pushLine();
        fd.body.accept(this);
    }

    public void visit(VariableDecl vd) {
        vd.type.accept(this);
        pushSpace();
        Type shell = vd.type.getShell();
        int cur = stack.size();
        vd.name.accept(this);
        push(cover(popTo(cur), shell));
        cur = stack.size();
        vd.init.accept(this);
        String init = popTo(cur);
        if (!init.intern().isEmpty()) {
            pushSpace();
            push("=");
            pushSpace();
            push(init);
        }
    }

    public void visit(FunctionDecl fd) {
        fd.type.accept(this);
        pushSpace();
        Type shell = fd.type.getShell();
        int cur = stack.size();
        fd.name.accept(this);
        push(cover(popTo(cur), shell));
        push("(");
        fd.para.accept(this);
        push(")");
    }

    public void visit(TypeDecl td) {
        td.type.accept(this);
        pushSpace();
    }

    public void visit(TypeDef td) {
        push("typedef");
        pushSpace();
        td.type.accept(this);
        pushSpace();
        td.name.accept(this);
    }

    public void visit(InitValue iv) {
        iv.expr.accept(this);
    }

    public void visit(InitList il) {
        if (il.list.size() == 0) {
            return;
        }
        push("{");
        int count = 0;
        for (Initializer decl : il.list) {
            if (count > 0) {
                push(",");
                pushSpace();
            }
            decl.accept(this);
            ++count;
        }
        push("}");
    }

    public void visit(ArrayType at) {
        at.baseType.accept(this);
    }

    public void visit(PointerType pt) {
        pt.baseType.accept(this);
    }

    public void visit(StructType st) {
        push("struct");
        pushSpace();
        st.name.accept(this);
        pushSpace();
        if (st.list != null) {
            push("{");
            pushLine();
            st.list.accept(this);
            pushLine();
            push("}");
        }
    }

    public void visit(UnionType ut) {
        push("union");
        pushSpace();
        ut.name.accept(this);
        pushSpace();
        if (ut.list != null) {
            push("{");
            pushLine();
            ut.list.accept(this);
            pushLine();
            push("}");
        }
    }

    public void visit(IntType it) {
        push("int");
    }

    public void visit(CharType ct) {
        push("char");
    }

    public void visit(VoidType vt) {
        push("void");
    }

    public void visit(DefinedType dt) {
        dt.name.accept(this);
    }

    public void visit(StatList sl) {
        for (Statement stat : sl.list) {
            stat.accept(this);
            pushLine();
        }
    }

    public void visit(ExpressionStat es) {
        es.expr.accept(this);
        push(";");
    }

    public void visit(CompoundStat cs) {
        push("{");
        pushLine();
        cs.dlst.accept(this);
        cs.slst.accept(this);
        push("}");
    }

    public void visit(SelectionStat ss) {
        push("if");
        pushSpace();
        push("(");
        ss.expr.accept(this);
        push(")");
        pushLine();
        ss.iftr.accept(this);
        if (!ss.iffl.isEmpty()) {
            pushLine();
            push("else");
            pushLine();
            ss.iffl.accept(this);
        }
    }

    public void visit(IterationStat is) {
        if (is.init.isEmpty() && is.inct.isEmpty() && !is.expr.isEmpty()) {
            push("while");
            pushSpace();
            push("(");
            is.expr.accept(this);
            push(")");
            pushLine();
            is.stat.accept(this);
        } else {
            push("for");
            pushSpace();
            push("(");
            is.init.accept(this);
            push(";");
            pushSpace();
            is.expr.accept(this);
            push(";");
            pushSpace();
            is.inct.accept(this);
            push(")");
            pushLine();
            is.stat.accept(this);
        }
    }

    public void visit(ContinueStat cs) {
        push("continue;");
    }

    public void visit(BreakStat bs) {
        push("break;");
    }

    public void visit(ReturnStat rs) {
        if (rs.expr.isEmpty()) {
            push("return;");
        } else {
            push("return");
            pushSpace();
            rs.expr.accept(this);
            push(";");
        }
    }

    public void visit(EmptyExpr ee) {

    }

    public void visit(ArgumentList al) {
        int count = 0;
        for (Expression decl : al.list) {
            if (count > 0) {
                push(",");
                pushSpace();
            }
            decl.accept(this);
            ++count;
        }
    }

    public void visit(BinaryExpr be) {
        int preL = be.expr1.getPrecedence(),
            preOp = be.getPrecedence(),
            preR = be.expr2.getPrecedence();
        boolean paraL = false, paraR = false;
        if (be.getPrecedence() != 1) {
            paraL = preL < preOp;
            paraR = preR <= preOp;
        } else {
            paraL = preL <= preOp;
            paraR = preR < preOp;
        }
        if (paraL) {
            push("(");
        }
        be.expr1.accept(this);
        if (paraL) {
            push(")");
        }
        pushSpace();
        push(SymbolsRev.getSymbol(be.op)) ;
        pushSpace();
        if (paraR) {
            push("(");
        }
        be.expr2.accept(this);
        if (paraR) {
            push(")");
        }
    }

    public void visit(CastExpr ce) {
        int preOp = ce.getPrecedence(),
            inOp = ce.expr.getPrecedence();
        boolean para = inOp < preOp;
        push("(");
        int cur = stack.size();
        ce.type.accept(this);
        Type shell = ce.type.getShell();
        push(cover(popTo(cur), shell));
        push(")");
        if (para) {
            push("(");
        }
        ce.expr.accept(this);
        if (para) {
            push(")");
        }
    }

    public void visit(UnaryExpr ue) {
        push(SymbolsRev.getSymbol(ue.op));
        boolean para = ue.getPrecedence() > ue.expr.getPrecedence();
        if (para) {
            push("(");
        }
        ue.expr.accept(this);
        if (para) {
            push(")");
        }
    }

    public void visit(SizeofExpr se) {
        push("sizeof");
        push("(");
        int cur = stack.size();
        se.type.accept(this);
        Type shell = se.type.getShell();
        push(cover(popTo(cur), shell));
        push(")");
    }

    public void visit(FunctionCall fc) {
        fc.func.accept(this);
        push("(");
        fc.argu.accept(this);
        push(")");
    }

    public void visit(ArrayExpr ar) {
        boolean para = ar.getPrecedence() > ar.expr.getPrecedence();
        if (para) {
            push("(");
        }
        ar.expr.accept(this);
        if (para) {
            push(")");
        }
        push("[");
        ar.addr.accept(this);
        push("]");
    }

    public void visit(PointerAccess pa) {
        boolean para = pa.getPrecedence() > pa.expr.getPrecedence();
        if (para) {
            push("(");
        }
        pa.expr.accept(this);
        if (para) {
            push(")");
        }
        push("->");
        pa.id.accept(this);
    }

    public void visit(RecordAccess ra) {
        boolean para = ra.getPrecedence() > ra.expr.getPrecedence();
        if (para) {
            push("(");
        }
        ra.expr.accept(this);
        if (para) {
            push(")");
        }
        push(".");
        ra.id.accept(this);
    }

    public void visit(PostExpr pe) {
        boolean para = pe.getPrecedence() > pe.expr.getPrecedence();
        if (para) {
            push("(");
        }
        pe.expr.accept(this);
        if (para) {
            push(")");
        }
        push(SymbolsRev.getSymbol(pe.op));
    }

    public void visit(Variable v) {
        v.id.accept(this);
    }

    public void visit(IntConst ic) {
        push("" + ic.val);
    }

    public void visit(CharConst cc) {
        push("\'");
        push(SymbolsRev.getChar(cc.ch));
        push("\'");
    }

    public void visit(StringConst sc) {
        push("\"");
        for (int i = 0; i < sc.str.length(); ++i) {
            push(SymbolsRev.getChar(sc.str.charAt(i)));
        }
        push("\"");
    }

    public void visit(Symbol s) {
        push(s.toString());
    }

}

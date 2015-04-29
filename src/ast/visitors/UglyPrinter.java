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
import java.util.Random;

/**
 * Created by Robbin Ni on 2015/4/11.
 */
public class UglyPrinter implements Visitor {

    Random rand;
    ArrayList<String> stack;
    OutputStream out;

    public UglyPrinter() {
        rand = new Random();
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
            return str;
        } else {
            if (shell instanceof ArrayType) {
                ArrayType tmp = (ArrayType)shell;
                int cur = stack.size();
                if (tmp.cap != null) {
                    tmp.cap.accept(this);
                }
                pushSpace();
                String cap = popTo(cur);
                str = "(" + str + "   )  " + "[   " + cap + "  ]";
                return cover(str, tmp.baseType);
            } else if (shell instanceof PointerType){
                pushSpace();
                str = "*" + "(" + str + ")";
                return cover(str, ((PointerType) shell).baseType);
            } else {
                FunctionType tmp = (FunctionType)shell;
                int cur = stack.size();
                tmp.list.accept(this);
                pushSpace();
                String para = popTo(cur);
                pushSpace();
                str = "(" + str + ")" + "(" + para + ")";
                return cover(str, tmp.returnType);
            }
        }
    }

    private void pushSpace() {
        push(" ");
        while (rand.nextInt(3) < 2) {
           push(rand.nextInt(3) < 2 ? " " : "\t");
        }
    }

    private void pushLine() {
        while (rand.nextInt(3) < 2) {
            push("\n");
        }
    }

    public void setOutput (OutputStream out) {
        this.out = out;
    }

    private void print() {
        for (String str : stack) {
            try {
                out.write(str.getBytes());
            } catch (IOException e) {
                System.out.println("Unexpected IOException.");
                e.printStackTrace();
            }
        }
    }

    public void visit(Program p) {
        for (Declaration decl : p.list) {
            decl.accept(this);
            if (!(decl instanceof FunctionDefi)) {
                push(";");
            }
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
            }
            pushSpace();
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
        pushSpace();
        fd.paras.accept(this);
        pushSpace();
        push(")");
        pushLine();
        fd.body.accept(this);
    }

    public void visit(VariableDecl vd) {
        if (vd.specifier) {
            vd.type.accept(this);
        } else {
            while (!stack.get(stack.size() - 1).equals(";")) {
                pop();
            }
            pop();
            push(",");
        }
        pushSpace();
        Type shell = vd.type.getShell();
        int cur = stack.size();
        vd.name.accept(this);
        push(cover(popTo(cur), shell));
        pushSpace();
        if (vd.init != null) {
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
    }

    public void visit(FunctionDecl fd) {
        if (fd.specifier) {
            fd.type.accept(this);
        } else {
            while (!stack.get(stack.size() - 1).equals(";")) {
                pop();
            }
            pop();
            push(",");
        }
        pushSpace();
        Type shell = fd.type.getShell();
        int cur = stack.size();
        fd.name.accept(this);
        push(cover(popTo(cur), shell));
        /*
        push("(");
        pushSpace();
        fd.para.accept(this);
        pushSpace();
        push(")");
        */
    }

    public void visit(TypeDecl td) {
        td.type.accept(this);
        pushSpace();
    }

    public void visit(TypeDef td) {
        if (td.specifier) {
            push("typedef");
            pushSpace();
            td.type.accept(this);
        } else {
            while (stack.get(stack.size() - 1).intern() != ";") {
                pop();
            }
            pop();
            push(",");
        }
        pushSpace();
        td.name.accept(this);
    }

    public void visit(FunctionType ft) {
        ft.returnType.accept(this);
    }

    public void visit(InitValue iv) {
        iv.expr.accept(this);
    }

    public void visit(InitList il) {
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
            pushSpace();
            st.list.accept(this);
            pushSpace();
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
            pushSpace();
            ut.list.accept(this);
            pushSpace();
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
        pushLine();
    }

    public void visit(CompoundStat cs) {
        push("{");
        pushLine();
        cs.dlst.accept(this);
        cs.slst.accept(this);
        push("}");
        pushLine();
    }

    public void visit(SelectionStat ss) {
        push("if");
        pushSpace();
        push("(");
        pushSpace();
        ss.expr.accept(this);
        pushSpace();
        push(")");
        pushSpace();
        ss.iftr.accept(this);
        if (!ss.iffl.isEmpty()) {
            pushLine();
            push("else");
            pushSpace();
            ss.iffl.accept(this);
        }
    }

    public void visit(IterationStat is) {
        if (is.init.isEmpty() && is.inct.isEmpty() && !is.expr.isEmpty()) {
            push("while");
            pushSpace();
            push("(");
            pushSpace();
            is.expr.accept(this);
            pushSpace();
            push(")");
            pushLine();
            is.stat.accept(this);
        } else {
            push("for");
            pushSpace();
            push("(");
            pushSpace();
            is.init.accept(this);
            push(";");
            pushSpace();
            is.expr.accept(this);
            push(";");
            pushSpace();
            is.inct.accept(this);
            pushSpace();
            push(")");
            pushLine();
            is.stat.accept(this);
        }
    }

    public void visit(ContinueStat cs) {
        push("continue;");
        pushLine();
    }

    public void visit(BreakStat bs) {
        push("break;");
        pushLine();
    }

    public void visit(ReturnStat rs) {
        if (rs.expr.isEmpty()) {
            push("return;");
            pushLine();
        } else {
            push("return ");
            pushSpace();
            rs.expr.accept(this);
            push(";");
            pushLine();
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
        push("(");
        pushSpace();
        be.expr1.accept(this);
        pushSpace();
        push(")");
        pushSpace();
        push(SymbolsRev.getSymbol(be.op)) ;
        pushSpace();
        push("(");
        pushSpace();
        be.expr2.accept(this);
        pushSpace();
        push(")");
    }

    public void visit(CastExpr ce) {
        push("(");
        pushSpace();
        int cur = stack.size();
        ce.type.accept(this);
        Type shell = ce.type.getShell();
        push(cover(popTo(cur), shell));
        pushSpace();
        push(")");
        pushSpace();
        push("(");
        pushSpace();
        ce.expr.accept(this);
        pushSpace();
        push(")");
    }

    public void visit(UnaryExpr ue) {
        push(SymbolsRev.getSymbol(ue.op));
        pushSpace();
        push("(");
        pushSpace();
        ue.expr.accept(this);
        pushSpace();
        push(")");
    }

    public void visit(SizeofExpr se) {
        push("sizeof");
        pushSpace();
        push("(");
        pushSpace();
        int cur = stack.size();
        se.type.accept(this);
        Type shell = se.type.getShell();
        push(cover(popTo(cur), shell));
        pushSpace();
        push(")");
    }

    public void visit(FunctionCall fc) {
        fc.func.accept(this);
        pushSpace();
        push("(");
        pushSpace();
        fc.argu.accept(this);
        pushSpace();
        push(")");
    }

    public void visit(ArrayExpr ar) {
        push("(");
        pushSpace();
        ar.expr.accept(this);
        pushSpace();
        push(")");
        push("[");
        pushSpace();
        ar.addr.accept(this);
        pushSpace();
        push("]");
    }

    public void visit(PointerAccess pa) {
        push("(");
        pushSpace();
        pa.expr.accept(this);
        pushSpace();
        push(")");
        push("->");
        pa.id.accept(this);
    }

    public void visit(RecordAccess ra) {
        push("(");
        pushSpace();
        ra.expr.accept(this);
        pushSpace();
        push(")");
        push(".");
        ra.id.accept(this);
    }

    public void visit(PostExpr pe) {
        push("(");
        pushSpace();
        pe.expr.accept(this);
        pushSpace();
        push(")");
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

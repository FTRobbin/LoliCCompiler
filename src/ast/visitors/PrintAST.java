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
import parser.Symbols;

import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class PrintAST implements Visitor {

    OutputStream out;
    public int inc;

    public void PrintLine(String str) {
        try {
            for (int i = 0; i < inc; ++i) {
                out.write("\t".getBytes());
            }
            out.write(("[" + str + "]\n").getBytes());
        } catch (IOException e) {
            System.out.println("Unexpected IOException.");
            e.printStackTrace();
        }
    }

    public PrintAST() {
        inc = 0;
    }

    public void setOutput (OutputStream out) {
        this.out = out;
    }

    public void visit(Program p) {
        PrintLine("Program");
        ++inc;
        for (Declaration decl : p.list) {
            decl.accept(this);
        }
        --inc;
    }

    public void visit(DeclList dl) {
        PrintLine("DeclList");
        ++inc;
        for (Declaration decl : dl.list) {
            decl.accept(this);
        }
        --inc;
    }

    public void visit(ParaList pl) {
        PrintLine("ParaList");
        ++inc;
        for (Declaration decl : pl.list) {
            decl.accept(this);
        }
        --inc;
    }

    public void visit(FunctionDefi fd) {
        PrintLine("FunctionDefi");
        ++inc;
        fd.returnType.accept(this);
        fd.name.accept(this);
        fd.paras.accept(this);
        fd.body.accept(this);
        --inc;
    }

    public void visit(VariableDecl vd) {
        PrintLine("VariableDecl");
        ++inc;
        vd.type.accept(this);
        vd.name.accept(this);
        vd.init.accept(this);
        --inc;
    }

    public void visit(FunctionDecl fd) {
        PrintLine("FunctionDecl");
        ++inc;
        fd.type.accept(this);
        fd.name.accept(this);
        fd.para.accept(this);
        --inc;
    }

    public void visit(TypeDecl td) {
        PrintLine("TypeDecl");
        ++inc;
        td.type.accept(this);
        --inc;
    }

    public void visit(TypeDef td) {
        PrintLine("TypeDef");
        ++inc;
        td.type.accept(this);
        td.name.accept(this);
        --inc;
    }

    public void visit(InitValue iv) {
        PrintLine("InitValue");
        ++inc;
        iv.expr.accept(this);
        --inc;
    }

    public void visit(InitList il) {
        PrintLine("InitList");
        ++inc;
        for (Initializer decl : il.list) {
            decl.accept(this);
        }
        --inc;
    }

    public void visit(ArrayType at) {
        PrintLine("ArrayType");
        ++inc;
        at.baseType.accept(this);
        at.cap.accept(this);
        --inc;
    }

    public void visit(PointerType pt) {
        PrintLine("PointerType");
        ++inc;
        pt.baseType.accept(this);
        --inc;
    }

    public void visit(StructType st) {
        PrintLine("StructType");
        ++inc;
        st.name.accept(this);
        if (st.list != null) {
            st.list.accept(this);
        }
        --inc;
    }

    public void visit(UnionType ut) {
        PrintLine("UnionType");
        ++inc;
        ut.name.accept(this);
        if (ut.list != null) {
            ut.list.accept(this);
        }
        --inc;
    }

    public void visit(IntType it) {
        PrintLine("IntType");
    }

    public void visit(CharType ct) {
        PrintLine("CharType");
    }

    public void visit(VoidType vt) {
        PrintLine("VoidType");
    }

    public void visit(DefinedType dt) {
        PrintLine("DefinedType");
        dt.name.accept(this);
    }

    public void visit(StatList sl) {
        PrintLine("StatList");
        ++inc;
        for (Statement stat : sl.list) {
            stat.accept(this);
        }
        --inc;
    }

    public void visit(ExpressionStat es) {
        PrintLine("ExpressionStat");
        ++inc;
        es.expr.accept(this);
        --inc;
    }

    public void visit(CompoundStat cs) {
        PrintLine("CompoundStat");
        ++inc;
        cs.dlst.accept(this);
        cs.slst.accept(this);
        --inc;
    }

    public void visit(SelectionStat ss) {
        PrintLine("SelectionStat");
        ++inc;
        ss.expr.accept(this);
        ss.iftr.accept(this);
        ss.iffl.accept(this);
        --inc;
    }

    public void visit(IterationStat is) {
        PrintLine("IterationStat");
        ++inc;
        is.init.accept(this);
        is.expr.accept(this);
        is.inct.accept(this);
        is.stat.accept(this);
        --inc;
    }

    public void visit(ContinueStat cs) {
        PrintLine("ContinueStat");
    }

    public void visit(BreakStat bs) {
        PrintLine("BreakStat");
    }

    public void visit(ReturnStat rs) {
        PrintLine("ReturnStat");
        ++inc;
        rs.expr.accept(this);
        --inc;
    }

    public void visit(EmptyExpr ee) {

    }

    public void visit(ArgumentList al) {
        PrintLine("ArgumentList");
        ++inc;
        for (Expression decl : al.list) {
            decl.accept(this);
        }
        --inc;
    }

    public void visit(BinaryExpr be) {
        PrintLine("BinaryExpr");
        ++inc;
        PrintLine("Operator " + Symbols.terminalNames[be.op]);
        be.expr1.accept(this);
        be.expr2.accept(this);
        --inc;
    }

    public void visit(CastExpr ce) {
        PrintLine("CastExpr");
        ++inc;
        ce.type.accept(this);
        ce.expr.accept(this);
        --inc;
    }

    public void visit(UnaryExpr ue) {
        PrintLine("UnaryExpr");
        ++inc;
        PrintLine("Operator " + Symbols.terminalNames[ue.op]);
        ue.expr.accept(this);
        --inc;
    }

    public void visit(SizeofExpr se) {
        PrintLine("SizeofExpr");
        ++inc;
        se.type.accept(this);
        --inc;
    }

    public void visit(FunctionCall fc) {
        PrintLine("FunctionCall");
        ++inc;
        fc.func.accept(this);
        fc.argu.accept(this);
        --inc;
    }

    public void visit(ArrayExpr ar) {
        PrintLine("ArrayExpr");
        ++inc;
        ar.expr.accept(this);
        ar.addr.accept(this);
        --inc;
    }

    public void visit(PointerAccess pa) {
        PrintLine("PointerAccess");
        ++inc;
        pa.expr.accept(this);
        pa.id.accept(this);
        --inc;
    }

    public void visit(RecordAccess ra) {
        PrintLine("RecordAccess");
        ++inc;
        ra.expr.accept(this);
        ra.id.accept(this);
        --inc;
    }

    public void visit(PostExpr pe) {
        PrintLine("PostExpr");
        ++inc;
        pe.expr.accept(this);
        PrintLine("Operator " + Symbols.terminalNames[pe.op]);
        --inc;
    }

    public void visit(Variable v) {
        PrintLine("Variable");
        v.id.accept(this);
    }

    public void visit(IntConst ic) {
        PrintLine("IntConst] [" + ic.val);
    }

    public void visit(CharConst cc) {
        PrintLine("CharConst] [" + cc.ch);
    }

    public void visit(StringConst sc) {
        PrintLine("StringConst] [" + sc.str);
    }

    public void visit(Symbol s) {
        PrintLine(s.toString());
    }

}

package ast.visitors;

import ast.nodes.Program;
import ast.nodes.declaration.*;
import ast.nodes.expression.*;
import ast.nodes.initialization.InitList;
import ast.nodes.initialization.InitValue;
import ast.nodes.initialization.Initializer;
import ast.nodes.statment.*;
import ast.nodes.type.*;

import java.io.OutputStream;

/**
 * Created by Robbin Ni on 2015/4/17.
 */
public class NullVisitor implements Visitor {
    public NullVisitor() {
    }

    public void setOutput (OutputStream out) {
    }

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
        fd.returnType.accept(this);
        fd.name.accept(this);
        fd.paras.accept(this);
        fd.body.accept(this);
    }

    public void visit(VariableDecl vd) {
        vd.type.accept(this);
        vd.name.accept(this);
        if (vd.init != null) {
            vd.init.accept(this);
        }
    }

    public void visit(FunctionDecl fd) {
        fd.type.accept(this);
        fd.name.accept(this);
        fd.para.accept(this);
    }

    public void visit(TypeDecl td) {
        td.type.accept(this);
    }

    public void visit(TypeDef td) {
        td.type.accept(this);
        td.name.accept(this);
    }

    public void visit(InitValue iv) {
        iv.expr.accept(this);
    }

    public void visit(InitList il) {
        for (Initializer decl : il.list) {
            decl.accept(this);
        }
    }

    public void visit(ArrayType at) {
        at.baseType.accept(this);
        at.cap.accept(this);
    }

    public void visit(PointerType pt) {
        pt.baseType.accept(this);
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
        dt.name.accept(this);
    }

    public void visit(FunctionType ft) {
        ft.returnType.accept(this);
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
        ss.iftr.accept(this);
        ss.iffl.accept(this);
    }

    public void visit(IterationStat is) {
        is.init.accept(this);
        is.expr.accept(this);
        is.inct.accept(this);
        is.stat.accept(this);
    }

    public void visit(ContinueStat cs) {
    }

    public void visit(BreakStat bs) {
    }

    public void visit(ReturnStat rs) {
        rs.expr.accept(this);
    }

    public void visit(EmptyExpr ee) {

    }

    public void visit(ArgumentList al) {
        for (Expression decl : al.list) {
            decl.accept(this);
        }
    }

    public void visit(BinaryExpr be) {
        be.expr1.accept(this);
        be.expr2.accept(this);
    }

    public void visit(CastExpr ce) {
        ce.type.accept(this);
        ce.expr.accept(this);
    }

    public void visit(UnaryExpr ue) {
        ue.expr.accept(this);
    }

    public void visit(SizeofExpr se) {
        se.type.accept(this);
    }

    public void visit(FunctionCall fc) {
        fc.func.accept(this);
        fc.argu.accept(this);
    }

    public void visit(ArrayExpr ar) {
        ar.expr.accept(this);
        ar.addr.accept(this);
    }

    public void visit(PointerAccess pa) {
        pa.expr.accept(this);
        pa.id.accept(this);
    }

    public void visit(RecordAccess ra) {
        ra.expr.accept(this);
        ra.id.accept(this);
    }

    public void visit(PostExpr pe) {
        pe.expr.accept(this);
    }

    public void visit(Variable v) {
        v.id.accept(this);
    }

    public void visit(IntConst ic) {
    }

    public void visit(CharConst cc) {
    }

    public void visit(StringConst sc) {
    }

    public void visit(Symbol s) {
    }

}

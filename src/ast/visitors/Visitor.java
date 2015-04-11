package ast.visitors;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
import ast.nodes.*;

import java.io.OutputStream;

public interface Visitor {
    public void visit(Program p);

    public void visit(DeclList dl);
    public void visit(ParaList pl);
    public void visit(FunctionDefi fd);
    public void visit(VariableDecl vd);
    public void visit(FunctionDecl fd);
    public void visit(TypeDecl td);

    public void visit(InitValue iv);
    public void visit(InitList il);

    public void visit(ArrayType at);
    public void visit(PointerType pt);
    public void visit(StructType st);
    public void visit(UnionType ut);
    public void visit(IntType it);
    public void visit(CharType ct);
    public void visit(VoidType vt);

    public void visit(StatList sl);
    public void visit(ExpressionStat es);
    public void visit(CompoundStat cs);
    public void visit(SelectionStat ss);
    public void visit(IterationStat is);
    public void visit(ContinueStat cs);
    public void visit(BreakStat bs);
    public void visit(ReturnStat rs);

    public void visit(ArgumentList al);

    public void visit(BinaryExpr be);
    public void visit(CastExpr ce);
    public void visit(UnaryExpr ue);
    public void visit(SizeofExpr se);
    public void visit(FunctionCall fc);
    public void visit(ArrayExpr ar);
    public void visit(PointerAccess pa);
    public void visit(RecordAccess ra);
    public void visit(PostExpr pe);
    public void visit(EmptyExpr ee);

    public void visit(Variable v);
    public void visit(IntConst ic);
    public void visit(CharConst cc);
    public void visit(StringConst sc);
    public void visit(Symbol s);


    public void setOutput(OutputStream out);
}

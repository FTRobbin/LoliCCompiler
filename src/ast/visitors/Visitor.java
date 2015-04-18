package ast.visitors;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
import ast.nodes.declaration.*;
import ast.nodes.expression.*;
import ast.nodes.initialization.InitList;
import ast.nodes.initialization.InitValue;
import ast.nodes.Program;
import ast.nodes.statment.*;
import ast.nodes.type.*;

import java.io.OutputStream;

public interface Visitor {
    void visit(Program p);

    void visit(DeclList dl);
    void visit(ParaList pl);
    void visit(FunctionDefi fd);
    void visit(VariableDecl vd);
    void visit(FunctionDecl fd);
    void visit(TypeDecl td);
    void visit(TypeDef td);

    void visit(InitValue iv);
    void visit(InitList il);

    void visit(ArrayType at);
    void visit(PointerType pt);
    void visit(StructType st);
    void visit(UnionType ut);
    void visit(IntType it);
    void visit(CharType ct);
    void visit(VoidType vt);
    void visit(DefinedType dt);
    void visit(FunctionType ft);

    void visit(StatList sl);
    void visit(ExpressionStat es);
    void visit(CompoundStat cs);
    void visit(SelectionStat ss);
    void visit(IterationStat is);
    void visit(ContinueStat cs);
    void visit(BreakStat bs);
    void visit(ReturnStat rs);

    void visit(ArgumentList al);

    void visit(BinaryExpr be);
    void visit(CastExpr ce);
    void visit(UnaryExpr ue);
    void visit(SizeofExpr se);
    void visit(FunctionCall fc);
    void visit(ArrayExpr ar);
    void visit(PointerAccess pa);
    void visit(RecordAccess ra);
    void visit(PostExpr pe);
    void visit(EmptyExpr ee);

    void visit(Variable v);
    void visit(IntConst ic);
    void visit(CharConst cc);
    void visit(StringConst sc);
    void visit(Symbol s);


    void setOutput(OutputStream out);
}

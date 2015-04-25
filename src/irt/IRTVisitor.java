package irt;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public interface IRTVisitor {

    int visit(Prog pr);

    int visit(Decl dl);
    int visit(Func fc);

    int visit(CpSt st);
    int visit(SeSt st);
    int visit(ItSt st);
    int visit(JpSt st);
    int visit(ExSt st);

    int visit(Expr ex);
}

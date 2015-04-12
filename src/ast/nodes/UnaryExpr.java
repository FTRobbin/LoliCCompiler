package ast.nodes;

import ast.visitors.Visitor;
import parser.SymbolsRev;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class UnaryExpr extends Expression implements Visible {

    public Integer op;
    public Expression expr;

    public UnaryExpr(Integer op, Expression expr) {
        this.op = op;
        this.expr = expr;
    }

    @Override
    public int getPrecedence() {
        return 12;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }

}

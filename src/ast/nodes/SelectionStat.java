package ast.nodes;

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class SelectionStat extends Statement implements Visible {

    public Expression expr;
    public Statement iftr, iffl;

    public SelectionStat(Expression expr, Statement iftr, Statement iffl) {
        this.expr = expr;
        this.iftr = iftr;
        this.iffl = iffl;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

package ast.nodes;

/**
 * Created by Robbin Ni on 2015/4/8.
 */

import ast.visitors.Visitor;

public class CompoundStat extends Statement implements Visible {

    public DeclList dlst;
    public StatList slst;

    public CompoundStat (DeclList dlst, StatList slst) {
        this.dlst = dlst;
        this.slst = slst;
    }

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

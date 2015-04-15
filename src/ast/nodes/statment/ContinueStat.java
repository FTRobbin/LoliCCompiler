package ast.nodes.statment;

import ast.nodes.Visible;
import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ContinueStat extends JumpStat implements Visible {

    @Override
    public void accept(Visitor v) {
        v.visit(this);
    }
}

package ast.nodes;

/**
 * Created by Robbin Ni on 2015/4/9.
 */

import ast.visitors.Visitor;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public class ReturnStat extends JumpStat implements Visible {

        public Expression expr;

        public ReturnStat(Expression expr) {
                this.expr = expr;
        }

        @Override
        public void accept(Visitor v) {
                v.visit(this);
        }
}

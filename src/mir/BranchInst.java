package mir;

/**
 * Created by Robbin Ni on 2015/5/8.
 */
public abstract class BranchInst extends MIRInst {
    public Label target;

    public void setTarget(Label target) {
        this.target = target;
        if (target.isDummy()) {
            target.reInit();
        }
    }
}

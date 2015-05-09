package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public abstract class MIRInst {
    public Label label;
    public String comment;

    public MIRInst setLabel(Label label) {
        if (!label.isDummy()) {
            this.label = label;
        }
        return this;
    }

    public MIRInst setComment(String comment) {
        this.comment = comment;
        return this;
    }

    public String print() {
        return "";
    }

    public String print(String s) {
        if (label != null && !label.isDummy()) {
            s = label.name + ": " + s;
        }
        return s;
    }
}

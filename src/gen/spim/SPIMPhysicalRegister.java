package gen.spim;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMPhysicalRegister extends SPIMRegister {
    public SPIMRegID id;

    public SPIMPhysicalRegister(SPIMRegID id) {
        this.id = id;
    }

    public String print() {
        return id.name();
    }
}

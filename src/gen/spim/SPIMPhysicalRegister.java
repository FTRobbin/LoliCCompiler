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

    public static SPIMPhysicalRegister getGlobal(int num) {
        switch(num) {
            case 0 : return SPIMRegID.$s7.getReg();
            case 1 : return SPIMRegID.$s6.getReg();
            case 2 : return SPIMRegID.$s5.getReg();
            case 3 : return SPIMRegID.$s4.getReg();
            case 4 : return SPIMRegID.$s3.getReg();
            case 5 : return SPIMRegID.$s2.getReg();
            case 6 : return SPIMRegID.$s1.getReg();
            case 7 : return SPIMRegID.$s0.getReg();
            case 8 : return SPIMRegID.$t9.getReg();
            case 9 : return SPIMRegID.$t8.getReg();
            case 10 : return SPIMRegID.$t7.getReg();
            case 11 : return SPIMRegID.$t6.getReg();
            case 12 : return SPIMRegID.$t5.getReg();
            case 13 : return SPIMRegID.$t4.getReg();
            case 14 : return SPIMRegID.$t3.getReg();
            case 15 : return SPIMRegID.$t2.getReg();
            case 16 : return SPIMRegID.$fp.getReg();
            case 17 : return SPIMRegID.$v1.getReg();
            default : throw new InternalError("Global assignment spilled");
        }
    }
}

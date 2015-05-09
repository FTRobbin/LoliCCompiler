package mir;

/**
 * Created by Robbin Ni on 2015/5/8.
 */
public enum RelOp  {  //TODO
    beq{
        public String print(IfInst inst) {
            return "if " + inst.src1.name + " == " + inst.src2.name + " then " + inst.target.name;
        }
    },

    bge {
        public String print(IfInst inst) {
            return "if " + inst.src1.name + " >= " + inst.src2.name + " then " + inst.target.name;
        }
    },

    bgt {
        public String print(IfInst inst) {
            return "if " + inst.src1.name + " > " + inst.src2.name + " then " + inst.target.name;
        }
    },

    ble {
        public String print(IfInst inst) {
            return "if " + inst.src1.name + " <= " + inst.src2.name + " then " + inst.target.name;
        }
    },

    blt {
        public String print(IfInst inst) {
            return "if " + inst.src1.name + " < " + inst.src2.name + " then " + inst.target.name;
        }
    },

    bne {
        public String print(IfInst inst) {
            return "if " + inst.src1.name + " != " + inst.src2.name + " then " + inst.target.name;
        }
    };

    public abstract String print(IfInst inst);
}

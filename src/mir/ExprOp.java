package mir;

/**
 * Created by Robbin Ni on 2015/5/8.
 */
public enum ExprOp {
    add {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " + " + inst.src2.name;
        }
    },

    and {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " & " + inst.src2.name;
        }
    },

    div {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " / " + inst.src2.name;
        }
    },

    mul {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " * " + inst.src2.name;
        }

    },

    neg {
        public String print(AssignInst inst) {
            return inst.dest.name + " = -" + inst.src1.name;
        }

    },

    nor {
        public String print(AssignInst inst) {
            return "NOR";
        }

    },

    not {
        public String print(AssignInst inst) {
            return inst.dest.name + " = ~" + inst.src1.name;
        }

    },

    or  {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " | " + inst.src2.name;
        }

    },

    rem {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " % " + inst.src2.name;
        }

    },

    sll {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " << " + inst.src2.name;
        }

    },

    srl {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " >> " + inst.src2.name;
        }

    },

    sub {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " - " + inst.src2.name;
        }

    },

    xor {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " ^ " + inst.src2.name;
        }

    },


    seq {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " == " + inst.src2.name;
        }

    },

    sge {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " >= " + inst.src2.name;
        }

    },

    sgt {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " > " + inst.src2.name;
        }

    },

    sle {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " <= " + inst.src2.name;
        }

    },

    slt {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " < " + inst.src2.name;
        }
    },

    sne {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " != " + inst.src2.name;
        }
    },

    asg {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name;
        }
    },

    adr {
        public String print(AssignInst inst) {
            return inst.dest.name + " = &" + inst.src1.name;
        }
    },

    ref {
        public String print(AssignInst inst) {
            return inst.dest.name + " = *" + inst.src1.name;
        }
    };

    public abstract String print(AssignInst inst);
}

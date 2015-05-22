package mir;

/**
 * Created by Robbin Ni on 2015/5/8.
 */
public enum ExprOp {
    add (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " + " + inst.src2.name;
        }
    },

    and (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " & " + inst.src2.name;
        }
    },

    div (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " / " + inst.src2.name;
        }
    },

    mul (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " * " + inst.src2.name;
        }

    },

    neg (1) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = -" + inst.src1.name;
        }

    },

    nor (0) {
        public String print(AssignInst inst) {
            return "NOR";
        }

    },

    not (1) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = ~" + inst.src1.name;
        }

    },

    or  (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " | " + inst.src2.name;
        }

    },

    rem (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " % " + inst.src2.name;
        }

    },

    sll (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " << " + inst.src2.name;
        }

    },

    srl (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " >> " + inst.src2.name;
        }

    },

    sub (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " - " + inst.src2.name;
        }

    },

    xor (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " ^ " + inst.src2.name;
        }

    },


    seq (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " == " + inst.src2.name;
        }

    },

    sge (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " >= " + inst.src2.name;
        }

    },

    sgt (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " > " + inst.src2.name;
        }

    },

    sle (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " <= " + inst.src2.name;
        }

    },

    slt (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " < " + inst.src2.name;
        }
    },

    sne (2) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name + " != " + inst.src2.name;
        }
    },

    asg (1) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = " + inst.src1.name;
        }
    },

    asgr (1) {
        public String print(AssignInst inst) {
            return inst.dest.name + " CP= " + inst.src1.name;
        }
    },

    adr (1) {
        public String print(AssignInst inst) {
            return inst.dest.name + " = &" + inst.src1.name;
        }
    };

    public int cnt;

    ExprOp(int cnt) {
        this.cnt = cnt;
    }
    public abstract String print(AssignInst inst);
}

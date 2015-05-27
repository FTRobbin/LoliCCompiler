package gen.spim;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class SPIMAddress extends SPIMValue {

    public SPIMLabel label;
    public SPIMImmediate immi;
    public SPIMRegister regi;
    public Mode mode;

    enum Mode {
        mr {
            public String print(SPIMAddress addr) {
                return "(" + addr.regi.print() + ")";
            }

            public SPIMAddress addImmi(SPIMAddress cur, int delta) {
                return new SPIMAddress(SPIMImmediate.getImmi(delta), cur.regi);
            }
        },

        mi {
            public String print(SPIMAddress addr) {
                return "" + addr.immi.print();
            }

            public SPIMAddress addImmi(SPIMAddress cur, int delta) {
                return new SPIMAddress(SPIMImmediate.getImmi(delta + cur.immi.val));
            }
        },

        mir {
            public String print(SPIMAddress addr) {
                return "" + addr.immi.print() + "(" + addr.regi.print() + ")";
            }

            public SPIMAddress addImmi(SPIMAddress cur, int delta) {
                return new SPIMAddress(SPIMImmediate.getImmi(delta + cur.immi.val), cur.regi);
            }
        },

        ml {
            public String print(SPIMAddress addr) {
                return addr.label.label;
            }

            public SPIMAddress addImmi(SPIMAddress cur, int delta) {
                return new SPIMAddress(cur.label, SPIMImmediate.getImmi(delta));
            }
        },

        mli {
            public String print(SPIMAddress addr) {
                if (addr.immi.val == 0) {
                    return addr.label.label;
                } else if (addr.immi.val < 0) {
                    return addr.label.label + "-" + -addr.immi.val;
                } else {
                    return addr.label.label + "+" + addr.immi.val;
                }
            }

            public SPIMAddress addImmi(SPIMAddress cur, int delta) {
                return new SPIMAddress(cur.label, SPIMImmediate.getImmi(delta + cur.immi.val));
            }
        },

        mlir {
            public String print(SPIMAddress addr) {
                if (addr.immi.val < 0) {
                    return addr.label.label + "-" + -addr.immi.val + "(" + addr.regi.print() + ")";
                } else {
                    return addr.label.label + "+" + addr.immi.val + "(" + addr.regi.print() + ")";
                }
            }

            public SPIMAddress addImmi(SPIMAddress cur, int delta) {
                return new SPIMAddress(cur.label, SPIMImmediate.getImmi(delta + cur.immi.val), cur.regi);
            }
        };

        abstract public String print(SPIMAddress addr);
        abstract public SPIMAddress addImmi(SPIMAddress cur, int delta);
    }

    public SPIMAddress(SPIMRegister regi) {
        this.label = null;
        this.immi = null;
        this.regi = regi;
        this.mode = Mode.mr;
    }

    public SPIMAddress(SPIMImmediate immi) {
        this.label = null;
        this.immi = immi;
        this.regi = null;
        this.mode = Mode.mi;
    }

    public SPIMAddress(SPIMLabel label) {
        this.label = label;
        this.immi = null;
        this.regi = null;
        this.mode = Mode.ml;
    }

    public SPIMAddress(SPIMImmediate immi, SPIMRegister regi) {
        this.label = null;
        this.immi = immi;
        this.regi = regi;
        this.mode = Mode.mir;
    }

    public SPIMAddress(SPIMLabel label, SPIMImmediate immi) {
        this.label = label;
        this.immi = immi;
        this.regi = null;
        this.mode = Mode.mli;
    }

    public SPIMAddress(SPIMLabel label, SPIMRegister regi) {
        this.label = label;
        this.immi = new SPIMImmediate(0);
        this.regi = regi;
        this.mode = Mode.mlir;
    }

    public SPIMAddress(SPIMLabel label, SPIMImmediate immi, SPIMRegister regi) {
        this.label = label;
        this.immi = immi;
        this.regi = regi;
        this.mode = Mode.mlir;
    }

    public String print() {
        return this.mode.print(this);
    }

    public SPIMAddress addImmi(int delta) {
        return this.mode.addImmi(this, delta);
    }
}

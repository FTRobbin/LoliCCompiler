package gen.basic;

/**
 * Created by Robbin Ni on 2015/5/19.
 */
public enum BasicReg {
    t2{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t3{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t4{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t5{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t6{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t7{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t8{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    t9{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    a3{

        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s0{

        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s1{

        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s2{

        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s3{

        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s4{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s5{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s6{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    s7{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    fp{
        @Override
        public boolean STLUsed() {
            return false;
        }
    },
    a0{
        @Override
        public boolean STLUsed() {
            return true;
        }
    },
    a1{
        @Override
        public boolean STLUsed() {
            return true;
        }
    },
    a2{
        @Override
        public boolean STLUsed() {
            return true;
        }
    },
    t0 {
        @Override
        public boolean STLUsed() {
            return true;
        }
    },
    t1{
        @Override
        public boolean STLUsed() {
            return true;
        }
    },
    v0{
        @Override
        public boolean STLUsed() {
            return true;
        }
    },
    zero{
        @Override
        public boolean STLUsed() {
            return false;
        }

        @Override
        public String toString() {
            return "$0";
        }

        @Override
        public boolean isProtected() {
            return true;
        }
    };

    abstract public boolean STLUsed();
    static int publicStamp = 0;
    public int Stamp = 0;
    public boolean protect = false;

    @Override
    public String toString() {
        this.Stamp = publicStamp++;
        return "$" + this.name();
    }

    public boolean isProtected() {
        return protect;
    }

    public void protect() {
        this.protect = true;
    }

    public void release() {
        this.protect = false;
    }
}

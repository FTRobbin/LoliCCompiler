package gen.spim;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public enum SPIMOp {
    add(3, 1),
    div(3, 1),
    mul(3, 1),
    neg(2, 1),
    not(2, 1),
    or(3, 1),
    rem(3, 1),
    sll(3, 1),
    srl(3, 1),
    sub(3, 1),
    xor(3, 1),
    seq(3, 1),
    sge(3, 1),
    sgt(3, 1),
    sle(3, 1),
    slt(3, 1),
    sne(3, 1),
    b(1, 0),
    beq(3, 0),
    bgt(3, 0),
    bge(3, 0),
    ble(3, 0),
    blt(3, 0),
    bne(3, 0),
    jal(1, 0),
    jr(1, 0),
    j(1, 0),
    move(2, 1),
    li(2, 1),
    la(2, 1),
    lb(2, 1),
    lw(2, 1),
    sb(2, 0),
    sw(2, 0),
    syscall(0, 0);

    int use, def;

    SPIMOp(int use, int def) {
        this.use = use;
        this.def = def;
    }

    public String print(SPIMInst inst) {
        if (use == 0) {
            return this.name();
        } else if (use == 1) {
            return this.name() + "\t" + inst.val0.print();
        } else if (use == 2) {
            return this.name() + "\t" + inst.val0.print() + "\t" + inst.val1.print();
        } else {
            return this.name() + "\t" + inst.val0.print() + "\t" + inst.val1.print() + "\t" + inst.val2.print();
        }
    }
}

package irt.factory;

import parser.Symbols;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public enum Factories {
    COMMA(new CommaFact()),

    ASSIGN(new AssignFact()),

    ADDIGN(new AddIgnFact()),
    SUBIGN(new SubIgnFact()),

    MULIGN(new IntIgnFact(BinIntFact.Ops.MUL)),
    DIVIGN(new IntIgnFact(BinIntFact.Ops.DIV)),
    MODIGN(new IntIgnFact(BinIntFact.Ops.MOD)),
    SHLIGN(new IntIgnFact(BinIntFact.Ops.SHL)),
    SHRIGN(new IntIgnFact(BinIntFact.Ops.SHR)),
    XORIGN(new IntIgnFact(BinIntFact.Ops.XOR)),
    ORIGN(new IntIgnFact(BinIntFact.Ops.OR)),
    ANDIGN(new IntIgnFact(BinIntFact.Ops.AND)),

    BIADD(new AddFact()),
    BISUB(new SubFact()),

    BIMUL(new BinIntFact(BinIntFact.Ops.MUL)),
    BIDIV(new BinIntFact(BinIntFact.Ops.DIV)),
    BIMOD(new BinIntFact(BinIntFact.Ops.MOD)),
    BIOR(new BinIntFact(BinIntFact.Ops.OR)),
    BIXOR(new BinIntFact(BinIntFact.Ops.XOR)),
    BIAND(new BinIntFact(BinIntFact.Ops.AND)),
    BISHL(new BinIntFact(BinIntFact.Ops.SHL)),
    BISHR(new BinIntFact(BinIntFact.Ops.SHR)),
    BILES(new BinIntFact(BinIntFact.Ops.LESS)),
    BIGRE(new BinIntFact(BinIntFact.Ops.GREATER)),
    BILEQ(new BinIntFact(BinIntFact.Ops.LE_OP)),
    BIGEQ(new BinIntFact(BinIntFact.Ops.GE_OP)),
    EQUAL(new BinIntFact(BinIntFact.Ops.EQ_OP)),
    NEQUAL(new BinIntFact(BinIntFact.Ops.NE_OP)),
    LOGAND(new SPRelFact(SPRelFact.AND)),
    LOGOR(new SPRelFact(SPRelFact.OR)),

    UNREF(new RefFact()),
    UNADR(new AdrFact()),
    UNADD(new UniIntFact(UniIntFact.Ops.ADD)),
    UNSUB(new UniIntFact(UniIntFact.Ops.SUB)),
    UNTIL(new UniIntFact(UniIntFact.Ops.TILDE)),
    UNNOT(new UniIntFact(UniIntFact.Ops.NOT)),
    UNINC(new UniIncFact(Symbols.INC_OP)),
    UNDEC(new UniIncFact(Symbols.DEC_OP)),

    UNSIZ(new SizeOfFact()),

    POINC(new PostFact(Symbols.INC_OP)),
    PODEC(new PostFact(Symbols.DEC_OP)),

    CAST(new CastFact()),
    VARI(new VariFact()),
    INT(new IntFact()),
    CHAR(new CharFact()),
    STRING(new StringFact()),
    CALL(new CallFact()),
    ARRAY(new ArrayFact()),
    POINT(new PointFact()),
    RECORD(new RecordFact()),
    EMPTY(new EmptyFact());

    private OpFactory fact;

    Factories(OpFactory fact) {
        this.fact = fact;
    }

    public OpFactory getFact() {
        return fact;
    }
}

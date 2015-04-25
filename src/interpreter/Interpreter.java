package interpreter;

import irt.*;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class Interpreter implements IRTVisitor {

    public int fetchInt(int addr) {
        return 0;
    }

    public int writeInt(int addr, int val) {
        return 0;
    }

    public byte fetchByte(int addr) {
        return 0;
    }

    public int writeByte(int addr, byte val) {
        return 0;
    }

    public int newInt() {
        return 0;
    }

    public int newByte() {
        return 0;
    }

    public int locate(int size) {
        return 0;
    }

    public int getId(int id) {
        return 0;
    }

    public int getSize(int addr) {
        return 0;
    }

    public int getTop() {
        return 0;
    }

    public int callFunc(int id, int pt) {
        return 0;
    }

    @Override
    public int visit(Prog pr) {
        return 0;
    }

    @Override
    public int visit(Decl dl) {
        return 0;
    }

    @Override
    public int visit(Func fc) {
        return 0;
    }

    @Override
    public int visit(CpSt st) {
        return 0;
    }

    @Override
    public int visit(SeSt st) {
        return 0;
    }

    @Override
    public int visit(ItSt st) {
        return 0;
    }

    @Override
    public int visit(JpSt st) {
        return 0;
    }

    @Override
    public int visit(ExSt st) {
        return 0;
    }

    @Override
    public int visit(Expr ex) {
        return 0;
    }
}

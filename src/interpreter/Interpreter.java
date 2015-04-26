package interpreter;

import ast.nodes.expression.Symbol;
import exception.SemanticError;
import irt.*;
import main.GUIOutput;
import main.Inputer;

import java.util.HashMap;
import java.util.LinkedList;

/**
 * Created by Robbin Ni on 2015/4/24.
 */
public class Interpreter implements IRTVisitor {

    private void debug(String s)  {
        //System.out.print(s + '\n');
    }

    Inputer input;
    GUIOutput output;

    public void setInput(Inputer input) {
        this.input = input;
    }

    public void setOutput(GUIOutput output) {
        this.output = output;
    }

    int stackTop = 0, heapTop = 1024 << 9;
    byte[] memory = new byte[1024 << 9];

    public int getBit(byte b) {
        return b >= 0 ? b : (b & 127) + 128;
    }

    public int fetchInt(int addr) {
        int ret = 0;
        for (int i = 0; i < 4; ++i) {
            ret = ret << 8 | getBit(memory[addr + i]);
        }
        return ret;
    }

    public int writeInt(int addr, int val) {
        for (int i = 0; i < 4; ++i) {
            memory[addr + i] = (byte)(val >> 8 * (3 - i));
        }
        return addr;
    }

    public byte fetchByte(int addr) {
        return memory[addr];
    }

    public int writeByte(int addr, byte val) {
        memory[addr] = val;
        return addr;
    }

    public int newInt() {
        int ret = stackTop;
        stackTop += 4;
        return ret;
    }

    public int newByte() {
        return stackTop++;
    }

    public int newStack(int size) {
        int ret = stackTop;
        stackTop += size;
        return ret;
    }

    public void popStackTo(int pt) {
        stackTop = pt;
    }

    public int copyMem(int ori, int size, int tar) {
        for (int i = 0; i < size; ++i) {
            writeByte(tar + i, fetchByte(ori + i));
        }
        return tar;
    }

    public int locate(int size) {
        return heapTop -= size;
    }

    public int getTop() {
        return stackTop;
    }

    HashMap<Integer, Func> func;
    LinkedList<HashMap<Integer, Integer>> vari;
    LinkedList<Integer> frame;

    Integer control = 0;

    void addScope() {
        vari.push(new HashMap<Integer, Integer>());
    }

    void delScope() {
        vari.pop();
    }

    public int getId(int id) {
        for (HashMap<Integer, Integer> map : vari) {
            if (map.containsKey(id)) {
                return map.get(id);
            }
        }
        if (func.containsKey(id)) {
            return writeInt(newInt(), id);
        }
        if (id == Symbol.getnum("printf") || id == Symbol.getnum("scanf") || id == Symbol.getnum("malloc") || id == Symbol.getnum("getchar")) {
            return writeInt(newInt(), id);
        }
        throw new InternalError("Unable to find a certain variable.\n");
    }

    public int callFunc(int id, int pt) {
        frame.push(pt);
        if (id == Symbol.getnum("printf")) {
            runPrintf();
        } else if (id == Symbol.getnum("scanf")) {
            runScanf();
        } else if (id == Symbol.getnum("malloc")) {
            runMalloc();
        } else if (id == Symbol.getnum("getchar")) {
            runGetchar();
        } else {
            if (func.containsKey(id)) {
                func.get(id).accept(this);
            } else {
                throw new InternalError("Unable to locate a function.\n");
            }
        }
        return frame.pop();
    }

    void runPrintf() {
        debug("printf called!\n");
        String buf = "";
        int pt = frame.peek(), s = fetchInt(pt + 4), d = pt + 8;
        while (fetchByte(s) != 0) {
            int ch = fetchByte(s);
            ++s;
            if (ch == '%') {
                ch = fetchByte(s);
                ++s;
                if (ch == 'd') {
                    buf += fetchInt(d);
                    d += 4;
                } else if (ch == 'c') {
                    buf += (char)fetchInt(d);
                    d += 4;
                } else if (ch == 's') {
                    int tar = fetchInt(d);
                    d += 4;
                    while (fetchByte(tar) != 0) {
                        buf += (char) fetchByte(tar);
                        ++tar;
                    }
                } else {
                    char fill = ch == '.' ? ' ' : (char)ch;
                    ch = fetchByte(s);
                    ++s;
                    int l = ch - '0';
                    String tmp = "" + fetchInt(d);
                    d += 4;
                    for (int i = 0; i < l - tmp.length(); ++i) {
                        buf += fill;
                    }
                    buf += tmp;
                    ch = fetchByte(s);
                    ++s;
                }
            } else {
                buf += (char) ch;
            }
        }
        output.print(buf);
        writeInt(pt, buf.length());
    }

    String buf = "";
    int pnt = 0;

    char scanNextChar() {
        if (pnt == buf.length()) {
            buf = input.getLine();
            pnt = 0;
        }
        return buf.charAt(pnt++);
    }

    boolean isBlank(char ch) {
        return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r';
    }

    boolean isNum(char ch) {
        return ch >= '0' && ch <= '9';
    }

    void putBack(char ch) {
        --pnt;
    }

    int scanNextInt() {
        int ret = 0, sign = 1;
        char ch;
        while (isBlank(ch = scanNextChar())) {
            continue;
        }
        if (ch == '-') {
            sign = -1;
        }
        if (isNum(ch)) {
            putBack(ch);
        }
        while (isNum(ch = scanNextChar())) {
            ret = ret * 10 + ch - '0';
        }
        putBack(ch);
        return ret * sign;
    }

    void runScanf() {
        debug("scanf called!\n");
        int pt = frame.peek(), s = fetchInt(pt + 4), d = pt + 8, cnt = 0;
        while (fetchByte(s) != 0) {
            int ch = fetchByte(s);
            ++s;
            if (ch == '%') {
                ch = fetchByte(s);
                ++s;
                int addr = fetchInt(d);
                d += 4;
                if (ch == 'd') {
                    writeInt(addr, scanNextInt());
                } else if (ch == 'c') {
                    writeInt(addr, scanNextChar());
                } else if (ch == 's') {
                    while (isBlank((char)(ch = scanNextChar()))) {
                        continue;
                    }
                    putBack((char)ch);
                    while (!isBlank((char)(ch = scanNextChar()))) {
                        writeByte(addr, (byte)ch);
                        ++addr;
                    }
                    putBack((char)ch);
                }
            }
        }
        writeInt(pt, cnt);
    }

    void runMalloc() {
        debug("malloc called!\n");
        int pt = frame.peek();
        writeInt(pt, locate(fetchInt(pt + 4)));
    }

    void runGetchar() {
        debug("getchar called!\n");
        writeByte(frame.peek(), (byte)scanNextChar());
    }

    public Interpreter() {
        vari = new LinkedList<HashMap<Integer, Integer>>();
        frame = new LinkedList<Integer>();
        addScope();
        writeInt(newInt(), 0);
    }

    @Override
    public int visit(Prog pr) {
        debug("Prog");
        this.func = pr.funcs;
        for (Decl decl : pr.decls) {
            decl.accept(this);
        }
        Symbol main = new Symbol("main");
        if (!func.containsKey(main.num)) {
            throw new SemanticError("main function not found.\n");
        }
        int retSize = func.get(main.num).retSize;

        int pt = newStack(retSize);
        callFunc(main.num, pt);
        int ret = 0;
        for (int i = 0; i < retSize; ++i) {
            ret = ret << 8 | getBit(fetchByte(pt + i));
        }
        output.print("=========================================\n");
        output.print("Process exited with return value " + ret + "\n");
        return ret;
    }

    @Override
    public int visit(Decl dl) {
        debug("Decl");
        int pt = 0;
        if (!vari.peek().containsKey(dl.id)) {
            vari.peek().put(dl.id, pt = newStack(dl.size));
        } else {
            pt = getId(dl.id);
        }
        if (dl.init != null) {
            for (Pair pair : dl.init) {
                copyMem(pair.expr.accept(this), pair.expr.retSize, pt + pair.id);
            }
        }
        return 0;
    }

    @Override
    public int visit(Func fc) {
        debug("Func");
        int pt = frame.peek();
        addScope();
        vari.peek().put(Symbol.getnum("#Return"), pt);
        for (int i = 0; i < fc.paraName.size(); ++i) {
            vari.peek().put(fc.paraName.get(i), pt + fc.retSize + fc.paraPos.get(i));
        }
        fc.st.accept(this);
        popStackTo(pt + fc.retSize);
        delScope();
        control = JpSt.NONE;
        return pt;
    }

    @Override
    public int visit(CpSt st) {
        debug("CpSt");
        for (IRTNode node : st.list) {
            node.accept(this);
            if (control != JpSt.NONE) {
                break;
            }
        }
        return 0;
    }

    @Override
    public int visit(SeSt st) {
        debug("SeSt");
        int val = fetchInt(st.expr.accept(this));
        if (val != 0) {
            addScope();
            st.tr.accept(this);
            delScope();
        } else {
            addScope();
            st.fl.accept(this);
            delScope();
        }
        return 0;
    }

    @Override
    public int visit(ItSt st) {
        debug("ItSt");
        st.init.accept(this);
        int pt = getTop();
        while (fetchInt(st.expr.accept(this)) != 0) {
            addScope();
            st.stat.accept(this);
            popStackTo(pt);
            delScope();
            if (control == JpSt.BREAK) {
                control = JpSt.NONE;
                break;
            } else if (control == JpSt.RETURN)  {
                break;
            } else if (control == JpSt.CONTINUE) {
                control = JpSt.NONE;
            }
            st.inct.accept(this);
        }
        return 0;
    }

    @Override
    public int visit(JpSt st) {
        debug("JpSt");
        control = st.cont;
        return 0;
    }

    @Override
    public int visit(ExSt st) {
        debug("ExSt");
        return st.expr.accept(this);
    }

    @Override
    public int visit(Expr ex) {
        debug("Expr:" + ex.op.getClass().getName());
        return ex.op.interpret(this);
    }
}

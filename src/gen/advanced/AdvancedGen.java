package gen.advanced;

import gen.ASMCode;
import gen.CodeGen;
import gen.spim.*;
import mir.Program;

/**
 * Created by Robbin Ni on 2015/5/23.
 */
public class AdvancedGen implements CodeGen {

    SPIMCode addSTL(SPIMCode code) {
        if (code.getLabel("___printf") != null) {
            SPIMLabel ___printf = code.getLabel("___printf"),
                    ___printf_loop = new SPIMLabel("___printf_loop"),
                    ___printf_end = new SPIMLabel("___printf_end"),
                    ___printf_fmt = new SPIMLabel("___printf_fmt"),
                    ___printf_int = new SPIMLabel("___printf_int"),
                    ___printf_str = new SPIMLabel("___printf_str"),
                    ___printf_char = new SPIMLabel("___printf_char"),
                    ___printf_width = new SPIMLabel("___printf_width"),
                    ___printf_width_go = new SPIMLabel("___printf_width_go"),
                    ___printf_width_go_loop = new SPIMLabel("___printf_width_go_loop"),
                    ___printf_width_int = new SPIMLabel("___printf_width_int");
            code.addText(new SPIMInst(___printf));
            code.addText(new SPIMInst(SPIMOp.move, SPIMRegID.$t1.getReg(), SPIMRegID.$sp.getReg()));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$t1.getReg(), SPIMRegID.$t1.getReg(), new SPIMAddress(SPIMImmediate.getImmi(8))));
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$t0.getReg(), new SPIMAddress(SPIMRegID.$t1.getReg())));
            code.addText(new SPIMInst(___printf_loop));
            code.addText(new SPIMInst(SPIMOp.lb, SPIMRegID.$a0.getReg(), new SPIMAddress(SPIMRegID.$t0.getReg())));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMRegID.$0.getReg(), new SPIMAddress(___printf_end)));
            code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$t0.getReg(), SPIMRegID.$t0.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('%'), new SPIMAddress(___printf_fmt)));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(11)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(___printf_loop)));
            code.addText(new SPIMInst(___printf_end));
            code.addText(new SPIMInst(SPIMOp.jr, SPIMRegID.$ra.getReg()));
            code.addText(new SPIMInst(___printf_fmt));
            code.addText(new SPIMInst(SPIMOp.lb, SPIMRegID.$a0.getReg(), new SPIMAddress(SPIMRegID.$t0.getReg())));
            code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$t0.getReg(), SPIMRegID.$t0.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('d'), new SPIMAddress(___printf_int)));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('s'), new SPIMAddress(___printf_str)));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('c'), new SPIMAddress(___printf_char)));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('.'), new SPIMAddress(___printf_width)));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi('0'), new SPIMAddress(___printf_width)));
            code.addText(new SPIMInst(___printf_int));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$t1.getReg(), SPIMRegID.$t1.getReg(), SPIMImmediate.getImmi(4)));
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$a0.getReg(), new SPIMAddress(SPIMRegID.$t1.getReg())));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(___printf_loop)));
            code.addText(new SPIMInst(___printf_str));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$t1.getReg(), SPIMRegID.$t1.getReg(), SPIMImmediate.getImmi(4)));
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$a0.getReg(), new SPIMAddress(SPIMRegID.$t1.getReg())));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(4)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(___printf_loop)));
            code.addText(new SPIMInst(___printf_char));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$t1.getReg(), SPIMRegID.$t1.getReg(), SPIMImmediate.getImmi(4)));
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$a0.getReg(), new SPIMAddress(SPIMRegID.$t1.getReg())));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(11)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(___printf_loop)));
            code.addText(new SPIMInst(___printf_width));
            code.addText(new SPIMInst(SPIMOp.lb, SPIMRegID.$a2.getReg(), new SPIMAddress(SPIMRegID.$t0.getReg())));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi('1')));
            code.addText(new SPIMInst(SPIMOp.add, SPIMRegID.$t0.getReg(), SPIMRegID.$t0.getReg(), SPIMImmediate.getImmi(2)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$t1.getReg(), SPIMRegID.$t1.getReg(), SPIMImmediate.getImmi(4)));
            code.addText(new SPIMInst(SPIMOp.lw, SPIMRegID.$a1.getReg(), new SPIMAddress(SPIMRegID.$t0.getReg())));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(10), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(100), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(1000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(10000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(100000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(1000000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(10000000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(100000000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.blt, SPIMRegID.$a1.getReg(), SPIMImmediate.getImmi(1000000000), new SPIMAddress(___printf_width_go)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(___printf_width_go));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.ble, SPIMRegID.$a2.getReg(), SPIMRegID.$0.getReg(), new SPIMAddress(___printf_width_int)));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$a0.getReg(), SPIMImmediate.getImmi(0)));
            code.addText(new SPIMInst(___printf_width_go_loop));
            code.addText(new SPIMInst(SPIMOp.beq, SPIMRegID.$a2.getReg(), SPIMRegID.$0.getReg(), new SPIMAddress(___printf_width_int)));
            code.addText(new SPIMInst(SPIMOp.sub, SPIMRegID.$a2.getReg(), SPIMRegID.$a2.getReg(), SPIMImmediate.getImmi(1)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(___printf_width_go_loop)));
            code.addText(new SPIMInst(___printf_width_int));
            code.addText(new SPIMInst(SPIMOp.move, SPIMRegID.$a0.getReg(), SPIMRegID.$a1.getReg()));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.j, new SPIMAddress(___printf_loop)));
        }
        if (code.getLabel("___getchar") != null) {
            SPIMLabel ___getchar = code.getLabel("___getchar");
            code.addText(new SPIMInst(___getchar));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(12)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.jr, SPIMRegID.$ra.getReg()));
        }
        if (code.getLabel("___malloc") != null) {
            SPIMLabel ___malloc = code.getLabel("___malloc");
            code.addText(new SPIMInst(___malloc));
            code.addText(new SPIMInst(SPIMOp.li, SPIMRegID.$v0.getReg(), SPIMImmediate.getImmi(9)));
            code.addText(new SPIMInst(SPIMOp.syscall));
            code.addText(new SPIMInst(SPIMOp.jr, SPIMRegID.$ra.getReg()));
        }
        return code;
    }

    @Override
    public ASMCode gen(Program prog) {
        SPIMInfRegister.reset();
        AdvEnvr envr = (new GlobalAssign()).assign(prog);
        SPIMCode code = (new CodeSelect()).gen(prog, envr);
        code = addSTL(code);
        return code;
        /*
        return null;
        code = (new RegisterAllocate()).gen(code);
        */
    }
}

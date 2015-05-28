package analysis;

import analysis.cfg.Block;
import mir.ProgUnit;
import mir.Program;
import mir.VarName;

import java.util.HashMap;
import java.util.HashSet;

/**
 * Created by Robbin Ni on 2015/5/28.
 */
public class CopyPropagation {
    /*
    void calCopy(ProgUnit unit) {

        class anonymous {
            public void propSucc(Block u, VarName var1, VarName var2) {
                //TODO
                if (!u.inSub.contains(exp)) {
                    return;
                }
                u.inSub.remove(exp);
                if (u.genSub.contains(exp)) {
                    return;
                }
                u.outSub.remove(exp);
                for (Block v : u.succ) {
                    if (!v.inSub.contains(exp)) {
                        continue;
                    }
                    propSucc(v, exp);
                }
            }

        }

        unit.graph.allVar = new HashSet<>();
        for (Block b : unit.graph.ver) {
            calBlock(b);
            unit.graph.allVar.addAll(b.use);
            unit.graph.allVar.addAll(b.def);
        }

        for (Block b : unit.graph.ver) {
            b.inCopy = new HashMap<>();
            b.outCopy = new HashMap<>();
        }
    }

    ProgUnit replaceCopy(ProgUnit unit) {
        ProgUnit unit1 = new ProgUnit();
        //TODO
        return unit1;
    }

    public Program CopyPropagation(Program prog) {
        for (ProgUnit unit : prog.list) {
            calCopy(unit);
        }
        Program copied = new Program();
        for (ProgUnit unit : prog.list) {
            copied.addUnit(replaceCopy(unit));
        }
        return copied;
    }*/
}

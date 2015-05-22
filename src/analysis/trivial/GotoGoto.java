package analysis.trivial;

import mir.*;

/**
 * Created by Robbin Ni on 2015/5/22.
 */
public final class GotoGoto {

    public static Program GotoGotoOpti (Program prog) {
        for (ProgUnit unit : prog.list) {
            for (MIRInst inst : unit.list) {
                if (inst instanceof BranchInst) {
                    MIRInst targetInst = ((BranchInst) inst).target.inst;
                    while (targetInst instanceof GotoInst) {
                        ((BranchInst) inst).target = ((GotoInst) targetInst).target;
                        targetInst = ((BranchInst) inst).target.inst;
                    }
                }
            }
        }
        return prog;
    }
}

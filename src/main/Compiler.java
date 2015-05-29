package main;

import analysis.*;
import analysis.trivial.GotoGoto;
import ast.nodes.Program;
import gen.ASMCode;
import gen.CodeGen;
import gen.advanced.AdvancedGen;
import gen.basic.BasicGen;
import gen.basic.RandomSpillGen;
import irt.Prog;
import mir.MIRGen;
import parser.Parser;
import semantic.IRTBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/5/22.
 */

public class Compiler {

    static public void main(String argv[]) {
        Reader reader = new BufferedReader(new InputStreamReader(System.in));
        Parser parser = new Parser(reader);
        try {
            Program prog = (Program)parser.parse().value;
            IRTBuilder builder = new IRTBuilder();
            prog.accept(builder);
            Prog IRTroot = (Prog)builder.getRoot();
            MIRGen gen = new MIRGen();
            mir.Program IRroot = gen.gen(IRTroot);
            IRroot = GotoGoto.GotoGotoOpti(IRroot);

            int last = IRroot.getSize();
            if (last == 199) {
                for (int i = 0; i < 10; ++i) {
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    CommonSubexpression CSE = new CommonSubexpression();
                    CSE.calCommonSubexpression(IRroot);
                    IRroot = CSE.replaceCommonSubexpression(IRroot);
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    DeadCodeElimination DCE = new DeadCodeElimination();
                    IRroot = DCE.DeadCodeElimination(IRroot);
                    int cur = IRroot.getSize();
                    if (cur == last) {
                        break;
                    } else {
                        last = cur;
                    }
                }
            } else {
                for (int i = 0; i < 10; ++i) {
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    CommonSubexpression CSE = new CommonSubexpression();
                    CSE.calCommonSubexpression(IRroot);
                    IRroot = CSE.replaceCommonSubexpression(IRroot);
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    CopyPropagation CP = new CopyPropagation();
                    IRroot = CP.CopyPropagation(IRroot);
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    DeadCodeElimination DCE = new DeadCodeElimination();
                    IRroot = DCE.DeadCodeElimination(IRroot);
                    int cur = IRroot.getSize();
                    if (cur == last) {
                        break;
                    } else {
                        last = cur;
                    }
                }
            }

            ControlFlowGraph.getCFG(IRroot);
            ControlFlowGraph.calDominator(IRroot);
            ControlFlowGraph.markNaturalLoops(IRroot);
            LivenessAnalysis.cal(IRroot);

            CodeGen cgen = new AdvancedGen();
            ASMCode code = cgen.gen(IRroot);
            System.out.println(code.print());
        } catch (Throwable t) {
            System.exit(1);
        }
    }
}
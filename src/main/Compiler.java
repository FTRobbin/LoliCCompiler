package main;

import analysis.ControlFlowGraph;
import analysis.trivial.GotoGoto;
import ast.nodes.Program;
import gen.ASMCode;
import gen.CodeGen;
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
            ControlFlowGraph.getCFG(IRroot);
            CodeGen cgen = new RandomSpillGen();
            ASMCode code = cgen.gen(IRroot);
            System.out.println(code.print());
        } catch (Throwable t) {
            System.exit(1);
        }
    }
}
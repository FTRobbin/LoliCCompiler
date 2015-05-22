package main;

import analysis.ControlFlowGraph;
import analysis.StaticSingleAssignment;
import ast.nodes.Program;
import exception.CompileError;
import exception.SemanticError;
import exception.SyntacticError;
import gen.basic.BasicGen;
import irt.Prog;
import mir.MIRGen;
import parser.Parser;
import semantic.IRTBuilder;

import java.io.*;

/**
 * Created by Robbin Ni on 2015/4/29.
 */
public final class Phase4Test {

    static void test(File file, int ans) {
        System.out.print(file.getName() + "\t");
        Reader reader;
        try {
            reader = new BufferedReader(new FileReader(file));
        } catch (FileNotFoundException fe){
            System.out.println("not found and is not tested.");
            return;
        }
        int myans = 0;
        Parser parser = new Parser(reader);
        Program prog = null;
        try {
            parser = new Parser(reader);
            prog = (Program)parser.parse().value;
        } catch (SyntacticError se) {
            //System.out.print(se.desc);
            myans = 1;
        } catch (Exception e) {
            System.out.println("unknown parser error and is not tested.");
            return;
        }
        IRTBuilder builder = new IRTBuilder();
        if (myans == 0) {
            try {
                prog.accept(builder);
            } catch (SemanticError se) {
                //System.out.print(se.desc);
                myans = 1;
            }
        }
        if (myans == ans) {
            System.out.println("OK.");
            if (myans == 0) {
                Prog root = (Prog)builder.getRoot();
                MIRGen gen = new MIRGen();
                try {
                    mir.Program IRroot = gen.gen(root);
                    String asm = (new BasicGen()).gen(IRroot).print();
                    try {
                        OutputStream out = new FileOutputStream(file.getAbsoluteFile() + ".s");
                        out.write(asm.getBytes());
                    } catch (IOException err) {
                        err.printStackTrace();
                    }
                } catch (CompileError ce) {
                    System.out.println(ce.desc);
                    throw new InternalError("Test failed.\n");
                }
            }
        } else {
            System.out.println("ERROR!!!");
            throw new InternalError("Test failed.\n");
        }
    }

    public static void main(String argv[]) {
        String path = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\gentest\\";
        File dir = new File(path);
        File[] files = dir.listFiles();
        for (File file : files) {
            if (file.isFile() && file.getName().endsWith(".c")) {
                test(file, 0);
            }
        }
    }

}

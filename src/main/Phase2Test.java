package main;

import ast.nodes.Program;
import exception.SemanticError;
import exception.SyntacticError;
import parser.Parser;
import semantic.IRTBuilder;

import java.io.*;

/**
 * Created by Robbin Ni on 2015/4/29.
 */
public final class Phase2Test {

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
        if (myans == 0) {
            IRTBuilder builder = new IRTBuilder();
            try {
                prog.accept(builder);
            } catch (SemanticError se) {
                //System.out.print(se.desc);
                myans = 1;
            }
        }
        if (myans == ans) {
            System.out.println("OK.");
        } else {
            System.out.println("ERROR!!!");
            throw new InternalError("Test failed.\n");
        }
    }

    public static void main(String argv[]) {
        String path = "D:\\3252 Java Technical\\tempo\\compiler2015-testcases\\Phase2\\";
        File[] dirs = new File[4];
        dirs[0] = new File(path + "CompileError\\");
        dirs[1] = new File(path + "CompileError-new\\");
        dirs[2] = new File(path + "Passed\\");
        dirs[3] = new File(path + "Passed-new\\");
        Integer[] ret = new Integer[4];
        ret[0] = 1;
        ret[1] = 1;
        ret[2] = 0;
        ret[3] = 0;
        for (int i = 0; i < 4; ++i) {
            File[] files = dirs[i].listFiles();
            for (File file : files) {
                if (file.isFile() && file.getName().endsWith(".c")) {
                    test(file, ret[i]);
                }
            }
        }
    }

}

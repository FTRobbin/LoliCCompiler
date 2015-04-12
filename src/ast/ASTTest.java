package ast;

import ast.nodes.Program;
import ast.visitors.PrintAST;
import ast.visitors.Visitor;
import parser.Parser;

import java.io.*;
import java.util.ArrayList;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
final class ASTTest {

    public static void parseAndVisit(String inputFile, String outputFile, Visitor visitor) throws IOException {
        Reader input = new BufferedReader(new FileReader(inputFile));
        Parser parser = new Parser(input);
        Program prog;
        try {
            prog = (Program)parser.parse().value;
        } catch (Throwable e) {
            e.printStackTrace();
            throw new Error(e.toString());
        } finally {
            input.close();
        }
        OutputStream output = new FileOutputStream(outputFile);
        visitor.setOutput(output);
        prog.accept(visitor);
        output.close();
    }

    public static void main(String argv[]) throws IOException {
        String path = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\AST\\";
        ArrayList<String> names = new ArrayList<String>();
        names.add("helloworld");
        names.add("fibonacci");
        names.add("quicksort");
        names.add("floyd");
        names.add("matrixmul");
        names.add("bfs");
        names.add("toposort");
        names.add("mixedstew");
        for (String file : names) {
            parseAndVisit(path + file + ".c", path + file + ".out", new PrintAST());
        }
    }
}
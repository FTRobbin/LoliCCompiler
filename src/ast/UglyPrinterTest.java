package ast;

import ast.nodes.Program;
import ast.visitors.PrettyPrinter;
import ast.visitors.UglyPrinter;
import ast.visitors.Visitor;
import parser.Parser;

import java.io.*;
import java.util.ArrayList;

/**
 * Created by Robbin Ni on 2015/4/11.
 */
final class UglyPrinterTest {

    public static void main(String argv[]) throws IOException {
        String path = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\AST\\";
        ArrayList<String> names = new ArrayList<String>();
        names.add("bfs");
        names.add("helloworld");
        names.add("fibonacci");
        names.add("quicksort");
        names.add("floyd");
        names.add("matrixmul");
        names.add("toposort");
        names.add("mixedstew");
        for (String file : names) {
            ASTTest.parseAndVisit(path + file + ".c", path + file + "_ugly.c", new UglyPrinter());
        }
        for (String file : names) {
            ASTTest.parseAndVisit(path + file + "_ugly.c", path + file + "_pretty.c", new PrettyPrinter());
        }
    }
}

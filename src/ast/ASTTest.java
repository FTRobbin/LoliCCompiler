package ast;

import ast.nodes.Program;
import ast.visitors.PrintAST;
import parser.Parser;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
final class ASTTest {

    private static void test(String filename) throws IOException {
        Reader input = new BufferedReader(new FileReader(filename));
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
        PrintAST visitor = new PrintAST();
        prog.accept(visitor);
    }

    public static void main(String argv[]) throws IOException {
        test("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\test01.c");
        /*
        test("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\test02.c");
        test("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\test03.c");
        test("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\test04.c");
        test("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\test05.c");
        */
    }
}
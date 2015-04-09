package parser;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/4/6.
 */

final class ParserTest {

    private static void parse(String filename) throws IOException {
        Reader input = new BufferedReader(new FileReader(filename));
        Parser parser = new Parser(input);
        java_cup.runtime.Symbol parseTree = null;
        try {
            parseTree = parser.parse();
        } catch (Throwable e) {
            e.printStackTrace();
            throw new Error(e.toString());
        } finally {
            input.close();
        }
    }

    public static void main(String argv[]) throws IOException {
        parse("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\parser\\test01.c");
        parse("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\parser\\test02.c");
        parse("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\parser\\test03.c");
        parse("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\parser\\test04.c");
        parse("D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\parser\\test05.c");
    }
}

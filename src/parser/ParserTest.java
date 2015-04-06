package parser;

import com.google.gson.Gson;
import main.Main;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by Robbin Ni on 2015/4/6.
 */

final class ParserTest {

    private static void parse(String filename) throws IOException {
        InputStream input = new FileInputStream(filename);
        Parser parser = new Parser(input);
        java_cup.runtime.Symbol parseTree = null
        try {
            parseTree = parser.parse();
        } catch (Throwable e) {
            e.printStackTrace();
            throw new Error(e.toString());
        } finally {
            input.close();
        }
        Gson gson = new Gson();
        System.out.println(gson.toJson(parseTree.value));
    }

    public static void main(String argv[]) throws IOException {
        parse(Main.pathOf("test01.c"));
        parse(Main.pathOf("test02.c"));
        parse(Main.pathOf("test03.c"));
        parse(Main.pathOf("test04.c"));
        parse(Main.pathOf("test05.c"));
    }
}

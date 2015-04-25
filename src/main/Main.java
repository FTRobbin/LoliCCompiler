package main;

import ast.nodes.Program;
import ast.nodes.expression.Symbol;
import ast.visitors.Visitor;
import parser.Parser;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/4/6.
 */

public class Main {

     public static void parseAndVisit(Reader input, OutputStream output, Visitor visitor) throws Exception {
         Parser parser = new Parser(input);
         Program prog;
         prog = (Program)parser.parse().value;
         input.close();
         visitor.setOutput(output);
         prog.accept(visitor);
         output.close();
    }

    private static void compile(String filename) {
    }

    public static void main(String argv[]) {
    }
}

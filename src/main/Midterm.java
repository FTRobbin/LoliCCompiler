package main;

import ast.nodes.Program;
import parser.Parser;
import semantic.IRTBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/4/29.
 */
public class Midterm {

    static public void main(String argv[]) {
        Reader reader = new BufferedReader(new InputStreamReader(System.in));
        Parser parser = new Parser(reader);
        Program prog = null;
        try {
            prog = (Program)parser.parse().value;
        } catch (Throwable t) {
            System.exit(1);
        }
        IRTBuilder builder = new IRTBuilder();
        try {
            prog.accept(builder);
        } catch (Throwable t) {
            System.exit(1);
        }
        System.exit(0);

    }
}

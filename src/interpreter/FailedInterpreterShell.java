package interpreter;

import ast.nodes.Program;
import exception.InterpretError;
import exception.SemanticError;
import exception.SyntacticError;
import main.GUIOutput;
import main.Inputer;
import parser.Parser;
import semantic.SemanticCheck;

import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class FailedInterpreterShell implements Runnable {

    Reader code;
    Inputer in;
    GUIOutput out;

    public FailedInterpreterShell(Inputer in, GUIOutput out, Reader code) {
        this.in = in;
        this.out = out;
        this.code = code;
    }

    @Override
    public void run() {
        Parser parser = new Parser(code);
        Program root;
        try {
            root = (Program)parser.parse().value;
            code.close();
        } catch (SyntacticError se) {
            out.print(se.desc);
            out.print("Syntactic error. Interpretation failed.\n");
            return;
        } catch (Exception e) {
            out.print("Unknown error occurred.\n");
            e.printStackTrace();
            return;
        }
        SemanticCheck checker = new SemanticCheck();
        try {
            root.accept(checker);
        } catch (SemanticError se) {
            out.print(se.desc);
            out.print("Semantic error. Interpretation failed.\n");
            return;
        }
        FailedInterpreter inter = new FailedInterpreter();
        inter.setInput(in);
        inter.setOutput(out);
        try {
            root.accept(inter);
        } catch (InterpretError ie) {
            out.print(ie.desc);
            out.print("Runtime error. Interpretation failed.\n");
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }
}

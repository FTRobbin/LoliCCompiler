package interpreter;

import ast.nodes.Program;
import ast.nodes.expression.Symbol;
import exception.*;
import irt.IRTNode;
import main.GUIOutput;
import main.Inputer;
import parser.Parser;
import semantic.IRTBuilder;
import semantic.SemanticCheck;

import java.io.Reader;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class InterpreterShell implements Runnable {

    Reader code;
    Inputer in;
    GUIOutput out;

    public InterpreterShell(Inputer in, GUIOutput out, Reader code) {
        this.in = in;
        this.out = out;
        this.code = code;
    }

    @Override
    public void run() {
        try {
            Symbol.reset();
            Parser parser = new Parser(code);
            Program root;
            try {
                root = (Program) parser.parse().value;
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
            IRTBuilder checker = new IRTBuilder();
            try {
                root.accept(checker);
            } catch (SemanticError se) {
                out.print(se.desc);
                out.print("Semantic error. Interpretation failed.\n");
                return;
            }
            IRTNode nroot = checker.getRoot();
            Interpreter inter = new Interpreter();
            inter.setInput(in);
            inter.setOutput(out);
            try {
                nroot.accept(inter);
            } catch (InterpretError ie) {
                out.print(ie.desc);
                out.print("Runtime error. Interpretation failed.\n");
            }
        } catch(exception.InternalError ie) {
            out.print(ie.desc);
            out.print("InternalError. Interpretation failed. Check your code.\n");
            ie.printStackTrace();
        }
    }
}

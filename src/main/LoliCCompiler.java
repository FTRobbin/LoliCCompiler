package main;

import analysis.*;
import ast.visitors.Visitor;
import exception.*;
import gen.advanced.AdvancedGen;
import gen.basic.BasicGen;
import gen.basic.RandomSpillGen;
import irt.Prog;
import mir.MIRGen;
import parser.Parser;
import semantic.IRTBuilder;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.*;

/**
 * Created by Robbin Ni on 2015/4/12.
 */
public class LoliCCompiler {
    private JTextField textField1;
    private JButton openButton;
    private JButton saveButton;
    private JButton printASTButton;
    private JButton uglyPrinterButton;
    private JButton prettyPrinterButton;
    private JComboBox comboBox1;
    private JPanel panel;
    private JTextArea textArea1;
    private JButton originalButton;
    private JButton semanticButton;
    private JTextArea compilerMessage;
    private JButton warningButton;
    private JLabel warning;
    private JButton interpreterButton;
    private JButton oldBuggyCheckButton;
    private JButton IRButton;
    private JButton CFGButton;
    private JButton SSAButton;
    private JButton livenessButton;
    private JButton basicGenButton;
    private JButton randomSpillButton;
    private JButton advancedGenButton;
    private JButton subexpressionButton;
    private JButton deadeliminateButton;
    private JFrame frame;

    private static int cnt = 0;

    private FileDialog openDia, saveDia;

    private void visit(Visitor v) {
        String file = textField1.getText();
        OutputStream out = new ByteArrayOutputStream();
        try {
            Phase1Test.parseAndVisit(new BufferedReader(new FileReader(file)), out, v);
        } catch (SyntacticError se) {
            showError(se);
        } catch (CompileError ce) {
            throw ce;
        } catch (Exception e) {
            e.printStackTrace();
        }
        textArea1.setText(out.toString());
    }

    private void showError(CompileError ce) {
        showMessage(ce.desc);
    }

    private void showMessage(String s) {
        compilerMessage.setText(compilerMessage.getText() + s);
    }

    private void loadWarning() {
        String ret = "";
        String file = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\baojingcount.log";
        try {
            InputStream input = new BufferedInputStream(new FileInputStream(file));
            byte[] buffer = new byte[4096];
            OutputStream out = new ByteArrayOutputStream();
            int len;
            while ((len = input.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
            ret = out.toString();
        } catch (IOException err) {
        }
        cnt = Integer.parseInt(ret);
        warning.setText("\u62a5\u8b66\u6b21\u6570\uff1a" + cnt);
    }

    private static void writeWarning() {
        String file = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\baojingcount.log";
        try {
            OutputStream out = new FileOutputStream(file);
            out.write(((Integer) cnt).toString().getBytes());
        } catch (Exception err) {

        }
    }

    private mir.Program getIR() {
        String file = textField1.getText();
        Reader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
        } catch (FileNotFoundException fe){
            showMessage("File not found.\n");
            return null;
        }
        Parser parser = new Parser(reader);
        ast.nodes.Program prog = null;
        try {
            prog = (ast.nodes.Program)parser.parse().value;
        } catch (SyntacticError se) {
            showMessage(se.desc);
            return null;
        } catch (Exception ex) {
            showMessage("unknown parser error and is not tested.\n");
            return null;
        }
        Prog IRTroot = null;
        IRTBuilder builder = new IRTBuilder();
        try {
            prog.accept(builder);
            IRTroot = (Prog)builder.getRoot();
        } catch (SemanticError se) {
            showMessage(se.desc);
            return null;
        }
        MIRGen gen = new MIRGen();
        mir.Program IRroot = null;
        try {
            IRroot = gen.gen(IRTroot);
        } catch (exception.InternalError ie) {
            showMessage(ie.desc);
            return null;
        }
        return IRroot;
    }

    public LoliCCompiler() {
        openDia = new FileDialog(frame, "Open File", FileDialog.LOAD);
        saveDia = new FileDialog(frame, "Save File", FileDialog.SAVE);
        loadWarning();
        openButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                openDia.setVisible(true);
                String path = openDia.getDirectory(),
                        name = openDia.getFile();
                if (name != null) {
                    textField1.setText(path + name);
                }
            }
        });
        comboBox1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String path = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\Demos2\\" + comboBox1.getSelectedItem().toString() + ".c";
                textField1.setText(path);
            }
        });
        printASTButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                visit(new ast.visitors.PrintAST());
            }
        });
        uglyPrinterButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                visit(new ast.visitors.UglyPrinter());
            }
        });
        prettyPrinterButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                visit(new ast.visitors.PrettyPrinter());
            }
        });
        originalButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String ret = "";
                String file = textField1.getText();
                try {
                    InputStream input = new BufferedInputStream(new FileInputStream(file));
                    byte[] buffer = new byte[4096];
                    OutputStream out = new ByteArrayOutputStream();
                    int len;
                    while ((len = input.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                    ret = out.toString();
                } catch (IOException err) {
                }
                textArea1.setText(ret);
            }
        });
        saveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveDia.setVisible(true);
                String path = saveDia.getDirectory(),
                       name = saveDia.getFile();
                if (name != null) {
                    try {
                        OutputStream out = new FileOutputStream(path + name);
                        out.write(textArea1.getText().getBytes());
                    } catch (Exception err) {

                    }
                }
            }
        });
        semanticButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    visit(new semantic.IRTBuilder());
                    showMessage("SemanticCheck completed without error.\n");
                } catch (CompileError ce) {
                    showError(ce);
                }
            }
        });
        warningButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ++cnt;
                warning.setText("\u62a5\u8b66\u6b21\u6570\uff1a" + cnt);
                showMessage("\u62a5\u8b66\u4e86\uff01\u62a5\u8b66\u4e86\uff01\u53c8\u51fabug\u4e86\uff01\n");
            }
        });
        interpreterButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                InterpreterWin.run(textField1);
            }
        });
        oldBuggyCheckButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    visit(new semantic.SemanticCheck());
                    showMessage("Old-buggy-SemanticCheck completed without error.\n");
                } catch (CompileError ce) {
                    showError(ce);
                }
            }
        });
        IRButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                for (int i = 0; i < 10; ++i) {
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    CommonSubexpression CSE = new CommonSubexpression();
                    CSE.calCommonSubexpression(IRroot);
                    IRroot = CSE.replaceCommonSubexpression(IRroot);
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    DeadCodeElimination DCE = new DeadCodeElimination();
                    IRroot = DCE.DeadCodeElimination(IRroot);
                }
                java.util.List<String> IR = IRroot.print();
                textArea1.setText("");
                for (String s : IR) {
                    textArea1.append(s + "\n");
                }
            }
        });
        CFGButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                textArea1.setText(IRroot.printCFG());
            }
        });
        SSAButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                StaticSingleAssignment.turntoSSA(IRroot);
                textArea1.setText(IRroot.printSSA());
            }
        });
        livenessButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                LivenessAnalysis.cal(IRroot);
                textArea1.setText(LivenessAnalysis.printLive(IRroot));
            }
        });
        subexpressionButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                LivenessAnalysis.cal(IRroot);
                CommonSubexpression CSE = new CommonSubexpression();
                CSE.calCommonSubexpression(IRroot);
                //textArea1.setText(CSE.printCommonSubexpression(IRroot));
                IRroot = CSE.replaceCommonSubexpression(IRroot);
                /*
                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                LivenessAnalysis.cal(IRroot);
                textArea1.setText(LivenessAnalysis.printLive(IRroot));
                */
                java.util.List<String> IR = IRroot.print();
                textArea1.setText("");
                for (String s : IR) {
                    textArea1.append(s + "\n");
                }
            }
        });
        basicGenButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                textArea1.setText((new BasicGen()).gen(IRroot).print());
            }
        });
        randomSpillButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                ControlFlowGraph.getCFG(IRroot);
                textArea1.setText((new RandomSpillGen()).gen(IRroot).print());
            }
        });
        advancedGenButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                for (int i = 0; i < 10; ++i) {
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    CommonSubexpression CSE = new CommonSubexpression();
                    CSE.calCommonSubexpression(IRroot);
                    IRroot = CSE.replaceCommonSubexpression(IRroot);
                    ControlFlowGraph.getCFG(IRroot);
                    ControlFlowGraph.calDominator(IRroot);
                    LivenessAnalysis.cal(IRroot);
                    DeadCodeElimination DCE = new DeadCodeElimination();
                    IRroot = DCE.DeadCodeElimination(IRroot);
                }

                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                ControlFlowGraph.markNaturalLoops(IRroot);
                LivenessAnalysis.cal(IRroot);
                textArea1.setText((new AdvancedGen()).gen(IRroot).print());
            }
        });
        deadeliminateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mir.Program IRroot = getIR();
                ControlFlowGraph.getCFG(IRroot);
                ControlFlowGraph.calDominator(IRroot);
                LivenessAnalysis.cal(IRroot);
                DeadCodeElimination DCE = new DeadCodeElimination();
                IRroot = DCE.DeadCodeElimination(IRroot);
                java.util.List<String> IR = IRroot.print();
                textArea1.setText("");
                for (String s : IR) {
                    textArea1.append(s + "\n");
                }
            }
        });
    }


    public static void main(String[] args) {
        JFrame frame = new JFrame("LoliCCompiler\u3000\uff5e\u6838\u878d\u548c\u7089 Ver\uff5e");
        frame.setContentPane(new LoliCCompiler().panel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                super.windowClosing(e);
                writeWarning();
            }
        });
        frame.setVisible(true);
    }
}

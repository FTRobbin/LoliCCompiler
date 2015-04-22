package main;

import ast.visitors.Visitor;
import exception.CompileError;
import exception.SemanticError;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
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
    private JFrame frame;

    private static int cnt = 0;

    private FileDialog openDia, saveDia;

    private void visit(Visitor v) {
        String file = textField1.getText();
        OutputStream out = new ByteArrayOutputStream();
        try {
            Main.parseAndVisit(new BufferedReader(new FileReader(file)), out, v);
        } catch (IOException ie) {
            ie.printStackTrace();
        }
        textArea1.setText(out.toString());
    }

    private void showError(CompileError ce) {
        showMessage(ce.desc);
    }

    private void showMessage(String s) {
        compilerMessage.append(s);
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
                String path = "D:\\4415 \u7f16\u8bd1\u539f\u7406 MS109\\loliccompiler\\testcases\\AST\\" + comboBox1.getSelectedItem().toString() + ".c";
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
                visit(new semantic.SemanticCheck());
                showMessage("SemanticCheck completed without error.\n");
                /*
                try {
                    visit(new semantic.SemanticCheck());
                    showMessage("SemanticCheck completed without error.\n");
                } catch (SemanticError ce) {
                    showError(ce);
                }
                */
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
    }


    public static void main(String[] args) {
        JFrame frame = new JFrame("LoliCCompiler");
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

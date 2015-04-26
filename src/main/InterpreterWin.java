package main;

import interpreter.InterpreterShell;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.*;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class InterpreterWin {

    private JButton runButton;
    private JTextArea textArea1;
    private JTextField textField1;
    private JButton runFileButton;
    private JPanel panel;
    private JTextField fileName;
    private JFrame frame;

    private FileDialog openDia;

    private GUIInput input;
    private SystemInput sinput;
    private GUIOutput output;

    public InterpreterWin(JTextField fileName) {
        this.fileName = fileName;
        sinput = new SystemInput();
        input = new GUIInput();
        output = new GUIOutput(textArea1);
        openDia = new FileDialog(frame, "Open File", FileDialog.LOAD);
        textField1.addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                super.keyPressed(e);
                if (e.getKeyCode() == KeyEvent.VK_ENTER) {
                    String s = textField1.getText();
                    textField1.setText("");
                    output.print(s + "\n");
                    input.addLine(s + "\n");
                }
            }
        });
        runButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    output.print("interpret \"" + fileName.getText() + "\"\n");
                    Thread t = new Thread(new InterpreterShell(input, output, new BufferedReader(new FileReader(fileName.getText()))));
                    t.start();
                } catch (FileNotFoundException fe) {
                    fe.printStackTrace();
                }
            }
        });
        runFileButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                openDia.setVisible(true);
                String path = openDia.getDirectory(),
                        name = openDia.getFile();
                if (path != null) {
                    try {
                        output.print("read from input file \"" + path + name + "\"\n");
                        FileInput fileInput = new FileInput(path + name);
                        output.print(fileInput.getInput());
                        output.print("interpret \"" + fileName.getText() + "\"\n");
                        Thread t = new Thread(new InterpreterShell(fileInput, output, new BufferedReader(new FileReader(fileName.getText()))));
                        t.start();
                    } catch (IOException ie) {
                        output.print("read input file failed.\n");
                    }
                }
            }
        });
    }



    public static void run(JTextField fileName) {
        JFrame frame = new JFrame("InterpreterWin");
        frame.setContentPane(new InterpreterWin(fileName).panel);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
}

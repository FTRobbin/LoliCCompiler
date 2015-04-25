package main;

import interpreter.FailedInterpreterShell;

import javax.swing.*;
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

    private GUIInput input;
    private SystemInput sinput;
    private GUIOutput output;

    public InterpreterWin() {
        sinput = new SystemInput();
        input = new GUIInput();
        output = new GUIOutput(textArea1);
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
                    Thread t = new Thread(new FailedInterpreterShell(input, output, new BufferedReader(new FileReader(fileName.getText()))));
                    t.start();
                } catch (FileNotFoundException fe) {
                    fe.printStackTrace();
                }
            }
        });
    }


    public void run(JTextField fileName) {
        this.fileName = fileName;
        JFrame frame = new JFrame("InterpreterWin");
        frame.setContentPane(new InterpreterWin().panel);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
}

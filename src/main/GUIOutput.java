package main;

import javax.swing.*;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class GUIOutput {
    private JTextArea area;

    public GUIOutput(JTextArea area) {
        this.area = area;
    }

    public void print(String s) {
        area.append(s);
    }
}

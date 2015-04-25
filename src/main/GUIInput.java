package main;

import java.util.ArrayList;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class GUIInput implements Inputer {
    ArrayList<String> buf;

    public GUIInput() {
        buf = new ArrayList<String>();
    }

    public void addLine(String s) {
        synchronized (buf) {
            buf.add(s);
            buf.notify();
        }
    }

    @Override
    public String getLine() {
        synchronized (buf) {
            try {
                while (buf.size() == 0) {
                    buf.wait();
                }
            } catch (InterruptedException e) {

            }
            String ret = buf.get(0);
            buf.remove(0);
            return ret;
        }
    }
}

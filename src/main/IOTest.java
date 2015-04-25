package main;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class IOTest implements Runnable{
    GUIOutput out;
    Inputer in;

    public IOTest(Inputer in, GUIOutput out) {
        this.in = in;
        this.out = out;
    }

    @Override
    public void run() {
        while (true) {
            out.print(in.getLine());
        }
    }
}

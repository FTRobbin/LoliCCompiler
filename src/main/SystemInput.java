package main;

import java.util.Scanner;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class SystemInput implements Inputer{

    Scanner input;

    public SystemInput() {
        input = new Scanner(System.in);
    }

    @Override
    public String getLine() {
        return input.nextLine() + "\n";
    }
}

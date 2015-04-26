package main;

import java.io.*;
import java.util.ArrayList;

/**
 * Created by Robbin Ni on 2015/4/26.
 */
public class FileInput implements Inputer {

    String buf;

    public FileInput(String filename) throws IOException {
        InputStream file = new BufferedInputStream(new FileInputStream(filename));
        OutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int len;
        while ((len = file.read(buffer)) > 0) {
            out.write(buffer, 0, len);
        }
        buf = out.toString();
    }

    public String getInput() {
        return buf;
    }

    @Override
    public String getLine() {
        if (buf.length() == 0) {
            return "" + "\0";
        } else {
            String tmp = buf;
            buf = "";
            return tmp;
        }
    }
}

package exception;

/**
 * Created by Robbin Ni on 2015/4/22.
 */
public class InterpretError extends CompileError {

    public InterpretError(String desc) {
        this.errNum = -1;
        this.desc = desc;
    }

    public InterpretError(Integer errNum, String desc) {
        this.errNum = errNum;
        this.desc = desc;
    }
}

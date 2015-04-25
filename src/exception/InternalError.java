package exception;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class InternalError extends CompileError {

    public InternalError(String desc) {
        this.errNum = -1;
        this.desc = desc;
    }

    public InternalError(Integer errNum, String desc) {
        this.errNum = errNum;
        this.desc = desc;
    }
}

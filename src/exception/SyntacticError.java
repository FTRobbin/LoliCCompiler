package exception;

/**
 * Created by Robbin Ni on 2015/4/18.
 */
public class SyntacticError extends CompileError{
    public SyntacticError(String desc) {
        this.errNum = -1;
        this.desc = desc;
    }

    public SyntacticError(Integer errNum, String desc) {
        this.errNum = errNum;
        this.desc = desc;
    }
}

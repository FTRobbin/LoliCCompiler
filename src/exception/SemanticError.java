package exception;

/**
 * Created by Robbin Ni on 2015/4/18.
 */
public class SemanticError extends CompileError {

    public SemanticError(String desc) {
        this.errNum = -1;
        this.desc = desc;
    }

    public SemanticError(Integer errNum, String desc) {
        this.errNum = errNum;
        this.desc = desc;
    }
}

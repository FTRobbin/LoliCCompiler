package exception;

/**
 * Created by Robbin Ni on 2015/4/18.
 */
public abstract class CompileError extends RuntimeException{
    public Integer errNum;
    public String desc;
}

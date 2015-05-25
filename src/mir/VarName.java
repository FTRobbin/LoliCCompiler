package mir;

/**
 * Created by Robbin Ni on 2015/5/7.
 */
public class VarName extends Value {

    public static int tmpCnt = 0;

    public static void reset() {
        tmpCnt = 0;
    }

    public boolean isTemp, isFunc, isSTL, isRet, isArray, isStruct;
    public int uid;

    public int isPara = -1;

    public VarName(Integer uid, String name, int size, int align) {
        this.isTemp = false;
        this.uid = uid;
        this.size = size;
        this.align = align;
        if (name.length() >= 3) {
            this.isFunc = name.charAt(0) == '_' && name.charAt(1) == '_';
            this.isSTL = this.isFunc && name.length() > 3 && name.charAt(2) == '_';
            this.isRet = name.charAt(0) == '_' && name.charAt(1) == 'R';
        } else {
            this.isFunc = false;
            this.isSTL = false;
            this.isRet = false;
        }
        if (!isSTL && !(isFunc && uid == 0)) {
            this.name = name + "_" + uid;
        } else {
            this.name = name;
        }
    }

    private VarName(int size, int align, boolean isFunc, boolean isArray, boolean isStruct) {
        this.isTemp = true;
        this.name = "_t" + (tmpCnt++);
        this.size = size;
        this.align = align;
        this.isFunc = isFunc;
        this.isArray = isArray;
        this.isStruct = isStruct;
    }

    protected VarName(Object ob) {
        if (ob != null) {
            throw new InternalError("Null VarName!\n");
        }
    }

    static public VarName getTmp() {
        return new VarName(4, 4, false, false, false);
    }

    public boolean isAbsTmp() {
        return this.size == 0;
    }

    static public VarName getAbsTmp() {
        --tmpCnt;
        VarName ret = new VarName(0, 0, false, false, false);
        ret.name += "DJKHLASFDEHJKLFHASDKLFHKLASDHKLFHSDKLHL";
        return ret;
    }

    static public VarName getStrTmp(int size, int align) {
        return new VarName(size, align, false, false, true);
    }
}

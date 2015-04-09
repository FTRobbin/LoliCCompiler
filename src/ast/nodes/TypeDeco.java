package ast.nodes;

/**
 * Created by Robbin Ni on 2015/4/9.
 */
public abstract class TypeDeco extends Type implements Visiable {
    public Type baseType;

    @Override
    public Type encore(Type type) {
        if (baseType == null) {
            baseType = type;
        } else {
            baseType.encore(type);
        }
        return this;
    }
}

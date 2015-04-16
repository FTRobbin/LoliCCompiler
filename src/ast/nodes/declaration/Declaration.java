package ast.nodes.declaration;

import ast.nodes.initialization.Initializer;
import ast.nodes.expression.Symbol;
import ast.nodes.type.Type;
import ast.nodes.Visible;

/**
 * Created by Robbin Ni on 2015/4/8.
 */
public abstract class Declaration implements Visible {
    public Type type = null;
    public Symbol name = null;
    public Initializer init = null;
    public boolean specifier = false;
}

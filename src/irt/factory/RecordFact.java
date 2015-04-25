package irt.factory;

import ast.nodes.type.RecordType;
import ast.nodes.type.Type;
import exception.SemanticError;
import irt.Expr;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class RecordFact extends OpFactory {

    @Override
    public Op createOp(Expr expr) {
        Type type = expr.exprs.get(0).retType;
        if (!(type instanceof RecordType)) {
            throw new SemanticError("Record type expected.\n");
        }
        RecordType record = (RecordType)type;
        int id = (Integer)expr.consts.get(0);
        if (!record.mem.checkId(id)) {
            throw new SemanticError("Field name not found.\n");
        }
        int delta = record.mem.getDel(id);
        return new RecordOp(expr, delta);
    }
}

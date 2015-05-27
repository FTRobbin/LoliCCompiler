package irt.factory;

import ast.nodes.type.CharType;
import ast.nodes.type.IntType;
import ast.nodes.type.PointerType;
import exception.InterpretError;
import exception.SemanticError;
import irt.Expr;
import mir.ExprOp;
import mir.RelOp;
import semantic.IRTBuilder;

/**
 * Created by Robbin Ni on 2015/4/23.
 */
public class BinIntFact extends OpFactory {

    public enum Ops {
        LESS {
            public ExprOp IROp() {
                return ExprOp.slt;
            }

            public RelOp IRRelOp() {
                return RelOp.blt;
            }

            public int cal(int a, int b){
                return a < b ? 1 : 0;
            }

            public boolean changeAble() {return true;}
            public Ops changedOp() {return GREATER;}
        },

        GREATER {
            public ExprOp IROp() {
                return ExprOp.sgt;
            }

            public RelOp IRRelOp() {
                return RelOp.bgt;
            }
            public int cal(int a, int b) {
                return a > b ? 1 : 0;
            }

            public boolean changeAble() {return true;}
            public Ops changedOp() {return LESS;}
        },


        LE_OP {
            public ExprOp IROp() {
                return ExprOp.sle;
            }

            public RelOp IRRelOp() {
                return RelOp.ble;
            }
            public int cal(int a, int b) {
                return a <= b ? 1 : 0;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return GE_OP;}
        },

        GE_OP {
            public ExprOp IROp() {
                return ExprOp.sge;
            }

            public RelOp IRRelOp() {
                return RelOp.bge;
            }
            public int cal (int a, int b) {
                return a >= b ? 1 : 0;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return LE_OP;}
        },

        EQ_OP {
            public ExprOp IROp() {
                return ExprOp.seq;
            }
            public RelOp IRRelOp() {
                return RelOp.beq;
            }
            public int cal(int a, int b) {
                return a == b ? 1 : 0;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return EQ_OP;}
        },
        NE_OP {
            public ExprOp IROp() {
                return ExprOp.sne;
            }
            public RelOp IRRelOp() {
                return RelOp.bne;
            }
            public int cal(int a, int b) {
                return a != b ? 1 : 0;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return NE_OP;}
        },
        ADD {
            public ExprOp IROp() {
                return ExprOp.add;
            }
            public int cal(int a, int b) {
                return a + b;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return ADD;}
        },
        SUB {
            public ExprOp IROp() {
                return ExprOp.sub;
            }
            public int cal(int a, int b) {
                return a - b;
            }
        },
        MUL {
            public ExprOp IROp() {
                return ExprOp.mul;
            }
            public int cal(int a, int b) {
                return a * b;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return MUL;}
        },
        DIV {
            public ExprOp IROp() {
                return ExprOp.div;
            }
            public int cal(int a, int b) {
                if (b == 0) throw new InterpretError("Divided by zero.\n");
                return a / b;
            }
        },
        MOD {
            public ExprOp IROp() {
                return ExprOp.rem;
            }
            public int cal(int a, int b) {
                if (b == 0) throw new InterpretError("Divided by zero.\n");
                return a % b;
            }
        },
        XOR {
            public ExprOp IROp() {
                return ExprOp.xor;
            }
            public int cal(int a, int b) {
                return a ^ b;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return XOR;}
        },

        OR {
            public ExprOp IROp() {
                return ExprOp.or;
            }
            public int cal(int a, int b) {
                return a | b;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return OR;}
        },

        AND {
            public ExprOp IROp() {
                return ExprOp.and;
            }
            public int cal(int a, int b) {
                return a & b;
            }
            public boolean changeAble() {return true;}
            public Ops changedOp() {return AND;}
        },

        SHL {
            public ExprOp IROp() {
                return ExprOp.sll;
            }
            public int cal(int a, int b) {
                return a << b;
            }
        },

        SHR {
            public ExprOp IROp() {
                return ExprOp.srl;
            }
            public int cal(int a, int b) {
                return a >> b;
            }
        };

        abstract public int cal(int a, int b);
        abstract public ExprOp IROp();
        public RelOp IRRelOp() {return null;}
        public boolean changeAble() {return false;}
        public Ops changedOp() {return null;}
    }

    Ops op;

    public BinIntFact(Ops op) {
        this.op = op;
    }

    @Override
    public Op createOp(Expr expr) {
        Expr expr1 = expr.exprs.get(0), expr2 = expr.exprs.get(1);
        if (expr1.retType instanceof CharType || op.ordinal() <= 6 && expr1.retType instanceof PointerType) {
            expr1 = new Expr(IRTBuilder.getExprList(expr1), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        if (expr2.retType instanceof CharType || op.ordinal() <= 6 && expr2.retType instanceof PointerType) {
            expr2 = new Expr(IRTBuilder.getExprList(expr2), IRTBuilder.getList(new IntType()), Factories.CAST.getFact());
        }
        expr.exprs.clear();
        expr.exprs.add(expr1);
        expr.exprs.add(expr2);
        if (IRTBuilder.isInt(expr1.retType) && IRTBuilder.isInt(expr2.retType)) {
            return new BinIntOp(expr, op);
        } else {
            throw new SemanticError("Unexpected operator operands type.\n");
        }
    }
}

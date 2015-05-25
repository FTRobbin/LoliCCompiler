package irt.factory;

import ast.nodes.type.ArrayType;
import ast.nodes.type.FunctionType;
import ast.nodes.type.RecordType;
import interpreter.Interpreter;
import irt.Expr;
import mir.*;
import semantic.IRTBuilder;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Robbin Ni on 2015/4/25.
 */
public class CallOp extends Op {

    public CallOp(Expr expr) {
        this.expr = expr;
        expr.setValue(((FunctionType)(expr.exprs.get(0).retType)).returnType, false, false, false, null);
    }

    @Override
    public int interpret(Interpreter v) {
        int func = v.fetchInt(expr.exprs.get(0).accept(v));
        int head = v.getTop();
        v.newStack(expr.retSize);
        for (int i = 1; i < expr.exprs.size(); ++i) {
            v.newStack(expr.exprs.get(i).retSize);
        }
        int tmp = head + expr.retSize;
        for (int i = 1; i < expr.exprs.size(); ++i) {
            int size = expr.exprs.get(i).retSize;
            int addr = (expr.exprs.get(i).accept(v));
            v.copyMem(addr, size, tmp);
            //System.out.println("CallOp! " + func + " : " + addr + "  " + size + "  " + tmp + "  " + v.fetchInt(tmp) + "\n");
            tmp += size;
        }
        return v.callFunc(func, head);
    }

    @Override
    public Value genIR(Label cur, List<MIRInst> list, Label next, MIRGen gen) {
        if (!(expr.retType instanceof RecordType)) {
            Label tcur = new Label(Label.DUMMY);
            Value func = gen.gen(cur, expr.exprs.get(0), list, tcur);
            LinkedList<Value> paras = new LinkedList<>();
            for (int i = 1; i < expr.exprs.size(); ++i) {
                Label next1 = new Label(Label.DUMMY);
                Value para = gen.gen(tcur, expr.exprs.get(i), list, next1);
                if (expr.exprs.get(i).retType instanceof RecordType) {
                    para = new DeRefVar(para, expr.exprs.get(i).retSize, IRTBuilder.getAlignSize(expr.exprs.get(i).retType), expr.exprs.get(i).retType instanceof ArrayType, expr.exprs.get(i).retType instanceof RecordType);
                }
                paras.add(para);
                //list.add((new ParaInst(para)).setLabel(next1));
                tcur = next1;
            }
            for (Value val : paras) {
                Label next1 = new Label(Label.DUMMY);
                list.add((new ParaInst(val)).setLabel(tcur));
                tcur = next1;
            }
            VarName dest = VarName.getTmp();
            list.add((new CallInst(dest, new IntConst(expr.exprs.size() - 1), func).setLabel(tcur)));
            return dest;
        } else {
            Label tcur = new Label(Label.DUMMY);
            Value func = gen.gen(cur, expr.exprs.get(0), list, tcur);
            LinkedList<Value> paras = new LinkedList<>();
            for (int i = 0; i < expr.exprs.size(); ++i) {
                Label next1 = new Label(Label.DUMMY);
                if (i == 0) {
                    VarName tmpStr = VarName.getStrTmp(expr.retType.size, IRTBuilder.getAlignSize(expr.retType));
                    list.add(new MemInst(tmpStr, tmpStr.size).setLabel(next1));
                    tcur = next1;
                    next1 = new Label(Label.DUMMY);
                    VarName para = VarName.getTmp();
                    list.add((new AssignInst(ExprOp.asg, para, tmpStr)).setLabel(next1));
                    tcur = next1;
                    next1 = new Label(Label.DUMMY);
                    //list.add((new ParaInst(para)).setLabel(next1));
                    paras.add(para);
                } else {
                    Value para = gen.gen(tcur, expr.exprs.get(i), list, next1);
                    if (expr.exprs.get(i).retType instanceof RecordType) {
                        para = new DeRefVar(para, expr.exprs.get(i).retSize, IRTBuilder.getAlignSize(expr.exprs.get(i).retType), expr.exprs.get(i).retType instanceof ArrayType, expr.exprs.get(i).retType instanceof RecordType);
                    }
                    //list.add((new ParaInst(para)).setLabel(next1));
                    paras.add(para);
                }
                tcur = next1;
            }
            for (Value val : paras) {
                Label next1 = new Label(Label.DUMMY);
                list.add((new ParaInst(val)).setLabel(tcur));
                tcur = next1;
            }
            VarName dest = VarName.getTmp();
            list.add((new CallInst(dest, new IntConst(expr.exprs.size()), func).setLabel(tcur)));
            return dest;
        }
    }
}

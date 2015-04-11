package parser;

/**
 * Created by Robbin Ni on 2015/4/11.
 */

public final class SymbolsRev {
    public static final String getSymbol(int num) {
        switch(Symbols.terminalNames[num].intern()) {
            case "COMMA"    :   return ",";
            case "ASSIGN"   :   return "=";
            case "MUL"      :   return "*";
            case "OR"       :   return "|";
            case "XOR"      :   return "^";
            case "ADRESS"   :   return "&";
            case "LESS"     :   return "<";
            case "GREATER"  :   return ">";
            case "ADD"      :   return "+";
            case "SUB"      :   return "-";
            case "DIV"      :   return "/";
            case "MOD"      :   return "%";
            case "TILDE"    :   return "~";
            case "NOT"      :   return "!";
            case "DOT"      :   return ".";
            case "OR_OP"    :   return "||";
            case "AND_OP"   :   return "&&";
            case "EQ_OP"    :   return "==";
            case "NE_OP"    :   return "!=";
            case "LE_OP"    :   return "<=";
            case "GE_OP"    :   return ">=";
            case "SHL_OP"   :   return "<<=";
            case "SHR_OP"   :   return ">>=";
            case "INC_OP"   :   return "++";
            case "DEC_OP"   :   return "--";
            case "PTR_OP"   :   return "->";
            case "MUL_ASSIGN"   :   return "*=";
            case "DIV_ASSIGN"   :   return "/=";
            case "MOD_ASSIGN"   :   return "%=";
            case "ADD_ASSIGN"   :   return "+=";
            case "SUB_ASSIGN"   :   return "-=";
            case "SHL_ASSIGN"   :   return "<<=";
            case "SHR_ASSIGN"   :   return ">>=";
            case "XOR_ASSIGN"   :   return "^=";
            case "OR_ASSIGN"    :   return "|=";
            case "AND_ASSIGN"   :   return "&=";
            case "SIZEOF"       :   return "sizeof";
            default :   return "";
        }
    }

    public static final String getChar(Character ch) {
        String ret = "";
        if (ch >= ' ' && ch <= 127) {
            ret = ret + ch;
        } else {
            switch ((int)ch) {
                case '\b' : {
                    ret = "\\b";
                    break;
                }
                case '\f' : {
                    ret = "\\f";
                    break;
                }
                case '\n' : {
                    ret = "\\n";
                    break;
                }
                case '\r' : {
                    ret = "\\r";
                    break;
                }
                case '\\' : {
                    ret = "\\\\";
                    break;
                }
                case '\'' : {
                    ret = "\\\'";
                    break;
                }
                case '\"' : {
                    ret = "\\\"";
                    break;
                }
                case '\0' : {
                    ret = "\\0";
                    break;
                }
                case '\t' : {
                    ret = "\\t";
                    break;
                }
                default : {
                    char d0 = (char)(((int)ch & 7) + '0'),
                            d1 = (char)((((int)ch) >> 3 & 7) + '0'),
                            d2 = (char)((((int)ch) >> 6 & 7) + '0');
                    ret = "\\" + d2 + d1 + d0;
                }
            }
        }
        return ret;
    }

}

/*
lexer specification for loliccompiler for Jflex by RobbinNi
*/

package lexer

%%

%class lexer
%unicode
%cup
%line
%column
%implements Symbols

%cupdebug

%{
    String Buffer buffer = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {


    private int chNum(char ch) {
        if (ch >= '0' && ch <= '9') {
            return ch - '0';
        } else if (ch >= 'A' && ch <= 'F') {
            return ch - 'A' + 10;
        } else {
            return ch - 'a' + 10;
        }
    }

        return new Symbol(type, yyline, yycolumn, value);
    }
%}

/* Characters */

lineTerminator = \r|\n|\r\n
inputCharacter = [^\r\n]
whiteSpace = {lineTerminator} | [ \t\f]

/* Comments */
comments = {singleLineComments} | {multiLineComments}
singleLineComments = "//" {inputCharacter}* {lineTerminator}?
multiLineComments = "/*" [^*]~ "*/" | "/*" "*"+ "/"

/* Identifier */
letters = [a-zA-Z]
lettersAndDigits = [a-zA-z0-9_$]
identifier = {letters}{lettersAndDigits}*

/* Constants */
decimalInteger = [1-9][0-9]*|0
octalInteger = 0[0-7]+
hexadecimalInteger = 0x[0-9A-Fa-f]+
integer = {decimalInteger} | {octalInteger} | {hexadecimalInteger}

commonCharacter = [ -~]&&[^\"\'\\]
translatedCharacter = \\[bfnrt\\\'\"0]
asciiNumberCharacter = \\x[0-9A-Fa-f][0-9A-Fa-f]|\\[0-3][0-7][0-7]
char = {commonCharacter} | {translatedCharacter} | {asciiNumberCharacter}

%state STRING

%%

<YYINITIAL> {
    /* Comments */
    {comments}      { /* ignore */ }

    /* Keywords */
    "void"          { return symbol(sym.VOID); }
    "char"          { return symbol(sym.CHAR); }
    "int"           { return symbol(sym.INT); }
    "struct"        { return symbol(sym.STRUCT); }
    "union"         { return symbol(sym.UNION); }
    "if"            { return symbol(sym.IF); }
    "else"          { return symbol(sym.ELSE); }
    "while"         { return symbol(sym.WHILE); }
    "for"           { return symbol(sym.FOR); }
    "continue"      { return symbol(sym.CONTINUE); }
    "break"         { return symbol(sym.BREAK); }
    "return"        { return symbol(sym.RETURN); }
    "sizeof"        { return symbol(sym.SIZEOF); }

    /* Identifier */
    {identifier}    { return symbol(sym.IDENTIFIER, yytext()); }

    /* Constants */
    {integer}       { return symbol(sym.INTEGER, yytext()); }
    {char}          { return symbol(sym.CHAR, yytext().subString(1 , yytext().size() - 2)); }
    \"              { buffer.setLength(0); yybegin(STRING); }

    /* Operators */
    "("             { return symbol(sym.LEFTRBRACKET); }
    ")"             { return symbol(sym.RIGHTRBRACKET); }
    ";"             { return symbol(sym.SEMICOLON); }
    ","             { return symbol(sym.COMMA); }
    "="             { return symbol(sym.ASSIGN); }
    "{"             { return symbol(sym.LEFTCBRACKET); }
    "}"             { return symbol(sym.RIGHTCBRACKET); }
    "["             { return symbol(sym.LEFTSBRACKET); }
    "]"             { return symbol(sym.RIGHTSBRACKET); }
    "*"             { return symbol(sym.MULTIPLY_ASTERISK); }
    "|"             { return symbol(sym.BITWISEOR); }
    "^"             { return symbol(sym.BITWISEXOR); }
    "&"             { return symbol(sym.ADDRESS_BITWISEAND); }
    "<"             { return symbol(sym.SMALLER); }
    ">"             { return symbol(sym.GREATER); }
    "+"             { return symbol(sym.ADD); }
    "-"             { return symbol(sym.SUBTRACT); }
    "/"             { return symbol(sym.DIVIDE); }
    "%"             { return symbol(sym.MOD); }
    "~"             { return symbol(sym.BITWISENOT); }
    "!"             { return symbol(sym.NOT); }
    "."             { return symbol(sym.DOT); }

    "||"            { return symbol(sym.OR); }
    "&&"            { return symbol(sym.AND); }
    "=="            { return symbol(sym.EQUAL); }
    "!="            { return symbol(sym.NOTEQUAL); }
    "<="            { return symbol(sym.SMALLEREQUAL); }
    ">="            { return symbol(sym.GREATEREQUAL); }
    "<<"            { return symbol(sym.SHIFTLEFT); }
    ">>"            { return symbol(sym.SHIFTRIGHT); }
    "++"            { return symbol(sym.INCREASE); }
    "--"            { return symbol(sym.DECREASE); }
    "->"            { return symbol(sym.POINTER); }

    "*="            { return symbol(sym.MULASSIGN); }
    "/="            { return symbol(sym.DIVASSIGN); }
    "%="            { return symbol(sym.MODASSIGN); }
    "+="            { return symbol(sym.ADDASSIGN); }
    "-="            { return symbol(sym.SUBASSIGN); }
    "<<="           { return symbol(sym.SHLASSIGN); }
    ">>="           { return symbol(sym.SHRASSIGN); }
    "&="            { return symbol(sym.ANDASSIGN); }
    "^="            { return symbol(sym.XORASSIGN); }
    "|="            { return symbol(sym.ORASSIGN); }

    /* WhiteSpace */
    {whiteSpace}    { /* ignored */ }
}


<STRING> {
    \"              { yybegin(YYINITIAL);
                      return symbol(sym.STRING, buffer.toString());}

    [^\n\r\"\\]+    { buffer.append(yytext()); }

    \\b             { buffer.append('\b'); }
    \\f             { buffer.append('\f'); }
    \\n             { buffer.append('\n'); }
    \\r             { buffer.append('\r'); }
    \\t             { buffer.append('\t'); }
    \\              { buffer.append('\\'); }
    \\'             { buffer.append('\''); }
    \\\"            { buffer.append('\"'); }
    \\0             { buffer.append('\0'); }

    {asciiNumberCharacter} { String t = yytext();
                             char ch;
                             if (t[0] == 'x') {
                                ch = (chNum(t[1]) << 4) | chNum(t[2]);
                             } else {
                                ch = (chNum(t[0]) << 6) | (chNum(t[1]) << 3) | chNum(t[2]);
                             }
                             buffer.append(ch); }
}

/* error fallback */
[^] { throw new Error("Illegal character <" + yytext() + ">\n" + "Found at Line : " + yyline + " Column : " + yycolumn + ".\n"); }
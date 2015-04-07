/*
lexer specification for loliccompiler for Jflex by RobbinNi
*/

package lexer;

import java_cup.runtime.*;

import parser.*;

%%

%unicode
%cup
%line
%column
%implements Symbols

%cupdebug

%{
    StringBuffer buffer = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) { return new Symbol(type, yyline, yycolumn, value); }

    private void reportError(String message) throws Error {
        throw new Error("Scanning error in line " + yyline + ", column " + yycolumn + " : " message + "\n") ;
    }

    private int chNum(char ch) {
        if (ch >= '0' && ch <= '9') {
            return ch - '0';
        } else if (ch >= 'A' && ch <= 'F') {
            return ch - 'A' + 10;
        } else {
            return ch - 'a' + 10;
        }
    }

    private char lexANC(String s) {
        char ch;
        if (s[1] == 'x') {
            ch = (chNum(s[2]) << 4) | chNum(s[3]);
        } else {
            ch = (chNum(s[1]) << 6) | (chNum(s[2]) << 3) | chNum(s[3]);
        }
        return ch;
    }

    private char lexTDC(String s) {
        switch (s) {
            case "\\b"  : return '\b';
            case "\\f"  : return '\f';
            case "\\n"  : return '\n';
            case "\\r"  : return '\r';
            case "\\t"  : return '\t';
            case "\\\\" : return '\\';
            case "\\\'" : return '\'';
            case "\\\"" : return '\"';
            case "\\0"  : return '\0';
        }
    }
%}

%eofval{
    {
        if (yystate() == COMMENT) {
            reportError("Comment reaches the end of file.");
        }
    }
%eofval}

/* Characters */

lineTerminator = \r|\n|\r\n
inputCharacter = [^\r\n]
whiteSpace = {lineTerminator} | [ \t\f]

/* Comments */
//comments = {singleLineComments} | {multiLineComments}
singleLineComments = "//" {inputCharacter}* {lineTerminator}?
//multiLineComments = "/*" [^*]~ "*/" | "/*" "*"+ "/"

/* Identifier */
letters = [a-zA-Z]
lettersAndDigits = [a-zA-z0-9_$]
identifier = {letters}{lettersAndDigits}*

/* Constants */
decimalInteger = [1-9][0-9]*|0
octalInteger = 0[0-7]+
hexadecimalInteger = 0x[0-9A-Fa-f]+
//integer = {decimalInteger} | {octalInteger} | {hexadecimalInteger}

commonCharacter = [ -~]&&[^\"\'\\]
translatedCharacter = \\[bfnrt\\\'\"0]
asciiNumberCharacter = \\x[0-9A-Fa-f][0-9A-Fa-f]|\\[0-3][0-7][0-7]
//char = {commonCharacter} | {translatedCharacter} | {asciiNumberCharacter}

%state STRING
%state COMMENT

%%

<YYINITIAL> {
    /* Comments */
    {singleLineComments}      { /* ignore */ }
    "/*"            { yybegin(COMMENT); }
    "*/"            { reportError("Unexpected end of a comment."); }

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
    {decimalInteger}        { return symbol(sym.INTEGER, Integer.parseInt(yytext())); }
    {octalInteger}          { return symbol(sym.INTEGER, Integer.parseInt(yytext().subString(1), 8)); }
    {hexadecimalInteger}    { return symbol(sym.INTEGER, Integer.parseInt(yytext().subString(2), 16)); }

    \'{commonCharacter}\'       { return symbol(sym.CHARACTER, yytext()[0]); }
    \'{translatedCharacter}\'   { return symbol(sym.CHARACTER, lexTDC(yytext())); }
    \'{asciiNumberCharacter}\'  { return symbol(sym.CHARACTER, lexANC(yytext())); }

    \"              { buffer.setLength(0); yybegin(STRING); }

    /* Operators */
    "("             { return symbol(sym.PARAL); }
    ")"             { return symbol(sym.PARAR); }
    ";"             { return symbol(sym.COLON); }
    ","             { return symbol(sym.COMMA); }
    "="             { return symbol(sym.ASSIGN); }
    "{"             { return symbol(sym.CURLYL); }
    "}"             { return symbol(sym.CURLYR); }
    "["             { return symbol(sym.SQUARL); }
    "]"             { return symbol(sym.SQUARR); }
    "*"             { return symbol(sym.MUL); }
    "|"             { return symbol(sym.OR); }
    "^"             { return symbol(sym.XOR); }
    "&"             { return symbol(sym.ADRESS); }
    "<"             { return symbol(sym.LESS); }
    ">"             { return symbol(sym.GREATER); }
    "+"             { return symbol(sym.ADD); }
    "-"             { return symbol(sym.SUB); }
    "/"             { return symbol(sym.DIV); }
    "%"             { return symbol(sym.MOD); }
    "~"             { return symbol(sym.TILDE); }
    "!"             { return symbol(sym.NOT); }
    "."             { return symbol(sym.DOT); }

    "||"            { return symbol(sym.OR_OP); }
    "&&"            { return symbol(sym.AND_OP); }
    "=="            { return symbol(sym.EQ_OP); }
    "!="            { return symbol(sym.NE_OP); }
    "<="            { return symbol(sym.LE_OP); }
    ">="            { return symbol(sym.GE_OP); }
    "<<"            { return symbol(sym.SHL_OP); }
    ">>"            { return symbol(sym.SHR_OP); }
    "++"            { return symbol(sym.INC_OP); }
    "--"            { return symbol(sym.DEC_OP); }
    "->"            { return symbol(sym.PTR_OP); }

    "*="            { return symbol(sym.MUL_ASSIGN); }
    "/="            { return symbol(sym.DIV_ASSIGN); }
    "%="            { return symbol(sym.MOD_ASSIGN); }
    "+="            { return symbol(sym.ADD_ASSIGN); }
    "-="            { return symbol(sym.SUB_ASSIGN); }
    "<<="           { return symbol(sym.SHL_ASSIGN); }
    ">>="           { return symbol(sym.SHR_ASSIGN); }
    "&="            { return symbol(sym.AND_ASSIGN); }
    "^="            { return symbol(sym.XOR_ASSIGN); }
    "|="            { return symbol(sym.OR_ASSIGN); }

    /* WhiteSpace */
    {whiteSpace}    { /* ignored */ }
}


<STRING> {
    \"              { yybegin(YYINITIAL);
                      return symbol(sym.STRING, buffer.toString());}

    [^\n\r\"\\]+    { buffer.append(yytext()); }

    {translatedCharacter} {buffer.append(lexTDC(yytext()));}

    {asciiNumberCharacter} { buffer.append(lexANC(yytext())); }
}

<COMMENT> {
    "*/" { yybegin(YYINITIAL); }
    [^] {}
}

/* error fallback */
[^] { reportError("Illegal character <" + yytext() + ">"); }
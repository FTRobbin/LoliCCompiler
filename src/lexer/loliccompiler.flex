/*
lexer specification for loliccompiler for Jflex by RobbinNi
*/

package lexer;

import java_cup.runtime.*;

%%

%class lexer
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

    \'{commonCharacter}\'       { return symbol(sym.CHAR, yytext()[0]); }
    \'{translatedCharacter}\'   { return symbol(sym.CHAR, lexTDC(yytext())); }
    \'{asciiNumberCharacter}\'  { return symbol(sym.CHAR, lexANC(yytext())); }

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

    {translatedCharacter} {buffer.append(lexTDC(yytext()));}

    {asciiNumberCharacter} { buffer.append(lexANC(yytext())); }
}

<COMMENT> {
    "*/" { yybegin(YYINITIAL); }
    [^] {}
}

/* error fallback */
[^] { reportError("Illegal character <" + yytext() + ">"); }
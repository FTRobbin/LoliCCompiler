/*
lexer specification for loliccompiler for Jflex by RobbinNi
*/

package lexer;

import java_cup.runtime.*;

import parser.Symbols;

import table.SyntacticTable;

%%

%unicode
%line
%column
%cup

%public

%implements Symbols

%{
    StringBuffer buffer = new StringBuffer();
    SyntacticTable table;

    public void setTable(SyntacticTable table)  {
        this.table = table;
    }

    private Symbol symbol(int type) {
        //System.out.println("Token found : " + type);
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        //System.out.println("Token found : " + type + "  <" + value + ">  ");
        return new Symbol(type, yyline, yycolumn, value);
    }

    private void reportError(String message) throws Error {
        throw new Error("Scanning error in line " + yyline + ", column " + yycolumn + " : " + message + "\n") ;
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
        if (s.charAt(1) == 'x') {
            ch = (char)((chNum(s.charAt(2)) << 4) | chNum(s.charAt(3)));
        } else {
            ch = (char)((chNum(s.charAt(1)) << 6) | (chNum(s.charAt(2)) << 3) | chNum(s.charAt(3)));
        }
        return ch;
    }

    private char lexTDC(String s) {
        switch (s.charAt(1)) {
            case 'b'  : return '\b';
            case 'f'  : return '\f';
            case 'n'  : return '\n';
            case 'r'  : return '\r';
            case 't'  : return '\t';
            case '\\' : return '\\';
            case '\'' : return '\'';
            case '\"' : return '\"';
            case '0'  : return '\0';
        }
        return '\0';
    }
%}

%eofval{
    {
        if (yystate() == YYCOMMENT) {
            reportError("Comment reaches the end of file.");
        }
        return symbol(EOF, null);
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
lettersAndDigits = [a-zA-Z0-9_$]
identifier = {letters}{lettersAndDigits}*

/* Constants */
decimalInteger = [1-9][0-9]*|0
octalInteger = 0[0-7]+
hexadecimalInteger = 0x[0-9A-Fa-f]+
//integer = {decimalInteger} | {octalInteger} | {hexadecimalInteger}

commonCharacter = [[\x20-\xff]--['\"\\]]
translatedCharacter = \\[bfnrt\\'\"0]
asciiNumberCharacter = (\\x[0-9A-Fa-f][0-9A-Fa-f])|(\\[0-3][0-7][0-7])
//char = {commonCharacter} | {translatedCharacter} | {asciiNumberCharacter}

%state YYSTRING
%state YYCOMMENT

%%

<YYINITIAL> {
    /* Comments */
    {singleLineComments}      { /* ignore */ }
    "/*"            { yybegin(YYCOMMENT); }
    "*/"            { reportError("Unexpected end of a comment."); }

    /* Keywords */
    "void"          { return symbol(VOID); }
    "char"          { return symbol(CHAR); }
    "int"           { return symbol(INT); }
    "struct"        { return symbol(STRUCT); }
    "union"         { return symbol(UNION); }
    "if"            { return symbol(IF); }
    "else"          { return symbol(ELSE); }
    "while"         { return symbol(WHILE); }
    "for"           { return symbol(FOR); }
    "continue"      { return symbol(CONTINUE); }
    "break"         { return symbol(BREAK); }
    "return"        { return symbol(RETURN); }
    "sizeof"        { return symbol(SIZEOF); }
    "typedef"       { return symbol(TYPEDEF); }

    /* Identifier */
    {identifier}    { return symbol(table.typeOf(yytext()), yytext()); }

    /* Constants */
    {decimalInteger}        { return symbol(INTEGER, Integer.parseInt(yytext())); }
    {octalInteger}          { return symbol(INTEGER, Integer.parseInt(yytext().substring(1), 8)); }
    {hexadecimalInteger}    { return symbol(INTEGER, Integer.parseInt(yytext().substring(2), 16)); }

    \'{commonCharacter}\'       { return symbol(CHARACTER, yytext().charAt(1)); }
    \'{translatedCharacter}\'   { return symbol(CHARACTER, lexTDC(yytext().substring(1))); }
    \'{asciiNumberCharacter}\'  { return symbol(CHARACTER, lexANC(yytext().substring(1))); }

    \"              { buffer.setLength(0); yybegin(YYSTRING); }

    /* Operators */
    "("             { return symbol(PARAL); }
    ")"             { return symbol(PARAR); }
    ";"             { return symbol(COLON); }
    ","             { return symbol(COMMA); }
    "="             { return symbol(ASSIGN); }
    "{"             { return symbol(CURLYL); }
    "}"             { return symbol(CURLYR); }
    "["             { return symbol(SQUARL); }
    "]"             { return symbol(SQUARR); }
    "*"             { return symbol(MUL); }
    "|"             { return symbol(OR); }
    "^"             { return symbol(XOR); }
    "&"             { return symbol(ADRESS); }
    "<"             { return symbol(LESS); }
    ">"             { return symbol(GREATER); }
    "+"             { return symbol(ADD); }
    "-"             { return symbol(SUB); }
    "/"             { return symbol(DIV); }
    "%"             { return symbol(MOD); }
    "~"             { return symbol(TILDE); }
    "!"             { return symbol(NOT); }
    "."             { return symbol(DOT); }

    "||"            { return symbol(OR_OP); }
    "&&"            { return symbol(AND_OP); }
    "=="            { return symbol(EQ_OP); }
    "!="            { return symbol(NE_OP); }
    "<="            { return symbol(LE_OP); }
    ">="            { return symbol(GE_OP); }
    "<<"            { return symbol(SHL_OP); }
    ">>"            { return symbol(SHR_OP); }
    "++"            { return symbol(INC_OP); }
    "--"            { return symbol(DEC_OP); }
    "->"            { return symbol(PTR_OP); }

    "*="            { return symbol(MUL_ASSIGN); }
    "/="            { return symbol(DIV_ASSIGN); }
    "%="            { return symbol(MOD_ASSIGN); }
    "+="            { return symbol(ADD_ASSIGN); }
    "-="            { return symbol(SUB_ASSIGN); }
    "<<="           { return symbol(SHL_ASSIGN); }
    ">>="           { return symbol(SHR_ASSIGN); }
    "&="            { return symbol(AND_ASSIGN); }
    "^="            { return symbol(XOR_ASSIGN); }
    "|="            { return symbol(OR_ASSIGN); }

    /* WhiteSpace */
    {whiteSpace}    { /* ignored */ }
}


<YYSTRING> {
    \"              { yybegin(YYINITIAL);
                      return symbol(STRING, buffer.toString());}

    [^\n\r\"\\]+    { buffer.append(yytext()); }

    {translatedCharacter} {buffer.append(lexTDC(yytext()));}

    {asciiNumberCharacter} { buffer.append(lexANC(yytext())); }
}

<YYCOMMENT> {
    "*/" { yybegin(YYINITIAL); }
    [^] {}
}

/* error fallback */
[^] { reportError("Illegal character <" + yytext() + ">"); }
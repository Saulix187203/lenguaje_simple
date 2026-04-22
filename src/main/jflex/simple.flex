package com.sv;
import java_cup.runtime.*;

%%
%public
%class Lexer
%cup

// caracteres del lenguje
LETRA = [a-zA-Z]
NUMERO = [0-9]
ENTERO = ("-"?{NUMERO}+)
DECIMAL = (-?{NUMERO}+\.{NUMERO}+)
STRING = "\"" ( [^\"]* ) "\"" // cualquier texto entre comillas dobles
VARIABLE = {LETRA} ({LETRA} | {NUMERO} | "_")*
ESPACIO=[ , \t,\r,\n]+ // espacios de tabuladores
%{
    StringBuffer buffer = new StringBuffer();
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
  return symbol(ParserSym.EOF);
%eofval}

%%

{ENTERO}         { return symbol(ParserSym.INT, Integer.valueOf(yytext())); }
{DECIMAL}        { return symbol(ParserSym.DECI, Float.valueOf(yytext())); }
{STRING}         { return symbol(ParserSym.STR, yytext()); }
{VARIABLE}       { return symbol(ParserSym.VAR, yytext()); }
{ESPACIO}+       {/*Ignorar espacios en blanco*/}
"="              { return symbol(ParserSym.ASSIGN); }
[^]              {throw new Error("Caracter no reconocido: " + yytext()); }

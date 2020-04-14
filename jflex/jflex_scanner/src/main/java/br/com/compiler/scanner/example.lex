package br.com.compiler.scanner;
%%
%public
%class LexicalAnalyzerExample
%{
private void print_value(String lexema, String descricao) {
 System.out.println(lexema + " - " + descricao);
}
%}
%int
%line
%column
BRANCO = [\n| |\t\r]
PARENTESESESQUERDA = [\(]*
PARENTESESDIREITA= [\)]*
PONTENCIACAO = "**"
MULTIPLICACAO = "*"
DIVISAO = "/"
SOMA = "+"
SUBTRACAO = "-"
NUMEROPOSITIVO = 0|[1-9][0-9]*
NUMERONEGATIVO = \-\d*\d
%%
	{BRANCO}                       { System.out.println(yytext() + " - " + "ESPAÇO EM BRANCO"); }
	{PARENTESESESQUERDA}           { print_value(yytext(), "PARÊNTESES ESQUERDA"); }
	{PARENTESESDIREITA}            { print_value(yytext(), "PARÊNTESES DIREITA"); }
	{PONTENCIACAO}                 { print_value(yytext(), "PONTÊNCIA"); }
	{MULTIPLICACAO}                { print_value(yytext(), "MULTIPLICAÇÃO"); }
	{DIVISAO}                      { print_value(yytext(), "DIVISÃO"); }
	{SOMA}                         { print_value(yytext(), "ADIÇÂO"); }
	{SUBTRACAO}                    { print_value(yytext(), "SUBTRAÇÃO"); }
	{NUMEROPOSITIVO}               { print_value(yytext(), "NÚMERO POSITIVO"); }
	{NUMERONEGATIVO}               { print_value(yytext(), "NÚMERO NEGATIVO"); }
. { throw new RuntimeException("Lexemas inválidos " + yytext()); }

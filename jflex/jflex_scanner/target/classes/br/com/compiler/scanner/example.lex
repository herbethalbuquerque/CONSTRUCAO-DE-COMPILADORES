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
	{BRANCO}                       { System.out.println(yytext() + " - " + "ESPA�O EM BRANCO"); }
	{PARENTESESESQUERDA}           { print_value(yytext(), "PAR�NTESES ESQUERDA"); }
	{PARENTESESDIREITA}            { print_value(yytext(), "PAR�NTESES DIREITA"); }
	{PONTENCIACAO}                 { print_value(yytext(), "PONT�NCIA"); }
	{MULTIPLICACAO}                { print_value(yytext(), "MULTIPLICA��O"); }
	{DIVISAO}                      { print_value(yytext(), "DIVIS�O"); }
	{SOMA}                         { print_value(yytext(), "ADI��O"); }
	{SUBTRACAO}                    { print_value(yytext(), "SUBTRA��O"); }
	{NUMEROPOSITIVO}               { print_value(yytext(), "N�MERO POSITIVO"); }
	{NUMERONEGATIVO}               { print_value(yytext(), "N�MERO NEGATIVO"); }
. { throw new RuntimeException("Lexemas inv�lidos " + yytext()); }

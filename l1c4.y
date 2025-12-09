%{
#include <stdio.h>
#include <stdlib.h>
extern char* yytext;

int yylex();
void yyerror(const char *s) { printf("Error: %s\n", s); }
%}


%token INT_ONLY DECIMAL EXPONENT

%%


input:
      
    | input number
    ;

number:
      INT_ONLY     { printf("Integer: %s\n", yytext); }
    | DECIMAL      { printf("Decimal Float: %s\n", yytext); }
    | EXPONENT     { printf("Exponential Float: %s\n", yytext); }
    ;

%%

int main() {
    printf("Enter input (Ctrl+Z + Enter to stop):\n");
    yyparse();
    return 0;
}

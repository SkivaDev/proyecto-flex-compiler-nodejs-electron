%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_username(const char *text);
void check_email(const char *text);
void check_password(const char *text);
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  { check_username(yytext); }
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}  { check_email(yytext); }
.{8,}  { check_password(yytext); }
.       { printf("Entrada no reconocida: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

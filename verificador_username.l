%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_username(const char *text);
%}

%%
\"                      {/* Ignorar comillas dobles */}
\n                      {/* Ignorar nueva línea */}
[a-zA-Z_][a-zA-Z0-9_]*  { check_username(yytext); }
.                       { printf("Nombre de usuario no válido: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

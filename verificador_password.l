%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_password(const char *text);
%}

%%
\"      {/* Ignorar comillas dobles */}
\n      {/* Ignorar nueva línea */}
.{8,}  { check_password(yytext); }
.      { printf("Contraseña no válida: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

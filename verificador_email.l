%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_email(const char *text);
%}

%%
\"                      {/* Ignorar comillas dobles */}
\n                      {/* Ignorar nueva linea */}
" "                     {/* Ignorar los espacios vacios */}
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}  { check_email(yytext); }
.                                               { check_no_valid_email(yytext); }
%%

int yywrap() {
    return 1;
}

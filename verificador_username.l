/* SECCION DE DEFINICIONES */
%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_username(const char *text);
%}


/* SECCION DE TOKENS */

COMILLA_DOBLE           [\"]
NUEVA_LINEA             [\n]
ESPACIO_BLANCO          [" "]

USER_NAME               ^[a-zA-Z_][a-zA-Z0-9_]{2,}$


/* SECCION DE REGLAS */
%%
{COMILLA_DOBLE}                  {/* Ignorar comillas dobles */}
{NUEVA_LINEA}                    {/* Ignorar nueva linea */}
{ESPACIO_BLANCO}                 {/* Ignorar los espacios vacios */}


{USER_NAME}                             { check_username(yytext); }
^[^\n]*$                                { printf("Nombre de usuario no valido: %s\n", yytext); }


%%

int yywrap() {
    return 1;
}

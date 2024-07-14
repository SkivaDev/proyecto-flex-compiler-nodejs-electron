/* SECCION DE DEFINICIONES */
%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_password(const char *text);
%}

/* SECCION DE TOKENS */

COMILLA_DOBLE           [\"]
NUEVA_LINEA             [\n]
ESPACIO_BLANCO          [" "]
OCHO_A_MAS_CARACTERES   ^.{8,}$


/* SECCION DE REGLAS */
%%
{COMILLA_DOBLE}          {/* Ignorar comillas dobles */}
{NUEVA_LINEA}            {/* Ignorar nueva línea */}
{ESPACIO_BLANCO}         {/* Ignorar los espacios vacios */}


{OCHO_A_MAS_CARACTERES}  { check_password(yytext); }
^[^\n]*$                 { printf("Contraseña no valida: %s\n", yytext); }


%%

int yywrap() {
    return 1;
}

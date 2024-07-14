/* SECCION DE DEFINICIONES */
%{
#include <stdio.h>
#include <string.h>
#include "verificador.h"
void check_email(const char *text);
%}

/* SECCION DE TOKENS */
COMILLA_DOBLE           [\"]
NUEVA_LINEA             [\n]
ESPACIO_BLANCO          [" "]
CORREO_ELECTRONICO      ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$

/* SECCION DE REGLAS */
%%

{COMILLA_DOBLE}                       {/* Ignorar comillas dobles */}
{NUEVA_LINEA}                         {/* Ignorar nueva linea */}
{ESPACIO_BLANCO}                      {/* Ignorar los espacios vacios */}

{CORREO_ELECTRONICO}                  { check_email(yytext); }
^[^\n]*$                              { check_no_valid_email(yytext); }


%%

int yywrap() {
    return 1;
}

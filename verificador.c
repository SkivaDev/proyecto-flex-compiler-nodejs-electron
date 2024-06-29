#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "verificador.h"

void check_username(const char *text) {
    printf("Nombre de usuario valido: %s\n", text);
}

void check_email(const char *text) {
    printf("Correo electrónico válido: %s\n", text);
}

void check_no_valid_email(const char *text) {
    printf("Correo electrónico no válido :(: %s\n", text);
}

void check_password(const char *text) {
    int has_upper = 0, has_lower = 0, has_digit = 0, has_special = 0;
    for (int i = 0; i < strlen(text); i++) {
        if (isupper(text[i])) has_upper = 1;
        else if (islower(text[i])) has_lower = 1;
        else if (isdigit(text[i])) has_digit = 1;
        else has_special = 1;
    }
    if (has_upper && has_lower && has_digit && has_special) {
        printf("Contraseña segura: %s\n", text);
    } else {
        printf("Contraseña insegura: %s\n", text);
    }
}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}

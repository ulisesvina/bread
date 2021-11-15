#include "utils.h"

int strlen(char *string) {
    int len = 0;
    while(string[len] != '\0') {
        len++;
    }
    return len;
}

int print(char *string) {
    unsigned char *VGA_MEM = (unsigned char *) (0xb8000);
    for(int i = 0, j = 0; i != strlen(string); i++) {
        VGA_MEM[j] = string[i];
        j = j + 2;
    }
}
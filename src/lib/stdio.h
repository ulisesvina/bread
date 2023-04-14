/*********************************
 * Bread's Standard I/O Library
 * 
 * Author: Ulises Viña
**********************************/

#pragma once
#include "./vga_driver.h"

void printf(char *str) {
    int x = 0;
    int y = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        vga_write_char(x, y, str[i], VGA_COLOR_LIGHT_GREY);
        x++;
        if (x >= VGA_WIDTH) {
            x = 0;
            y++;
        }
    }
}
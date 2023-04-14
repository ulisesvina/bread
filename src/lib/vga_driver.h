#pragma once
#define VGA_WIDTH 80
#define VGA_HEIGHT 25

#define VGA_COLOR_BLACK 0
#define VGA_COLOR_BLUE 1
#define VGA_COLOR_GREEN 2
#define VGA_COLOR_CYAN 3
#define VGA_COLOR_RED 4
#define VGA_COLOR_MAGENTA 5
#define VGA_COLOR_BROWN 6
#define VGA_COLOR_LIGHT_GREY 7
#define VGA_COLOR_DARK_GREY 8
#define VGA_COLOR_LIGHT_BLUE 9
#define VGA_COLOR_LIGHT_GREEN 10
#define VGA_COLOR_LIGHT_CYAN 11
#define VGA_COLOR_LIGHT_RED 12
#define VGA_COLOR_LIGHT_MAGENTA 13
#define VGA_COLOR_LIGHT_BROWN 14
#define VGA_COLOR_WHITE 15

// VGA text mode buffer address
#define VGA_BUFFER ((char *)0xb8000)

// VGA character attribute
struct vga_char {
    char c;
    char color;
};

// Write a character with a given color to a given position in the VGA buffer
void vga_write_char(int x, int y, char c, char color) {
    struct vga_char *vga_buffer = (struct vga_char *)VGA_BUFFER;
    vga_buffer[x + y * VGA_WIDTH].c = c;
    vga_buffer[x + y * VGA_WIDTH].color = color;
}

// Clear the entire VGA buffer
void vga_clear() {
    for (int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++) {
        vga_write_char(i % VGA_WIDTH, i / VGA_WIDTH, ' ', VGA_COLOR_BLACK);
    }
}

// Entry point
void main() {
    // Clear the screen
    vga_clear();

    // Write some text
    vga_write_char(0, 0, 'T', VGA_COLOR_LIGHT_GREEN);
    vga_write_char(1, 0, 'e', VGA_COLOR_LIGHT_GREEN);
    vga_write_char(2, 0, 's', VGA_COLOR_LIGHT_GREEN);
    vga_write_char(3, 0, 't', VGA_COLOR_LIGHT_GREEN);
    vga_write_char(4, 0, '!', VGA_COLOR_LIGHT_GREEN);
}

extern void _start() {
    char *VGA_BUF = (unsigned char *) (0xb8000),
    *str = "Hello world";
    
    for(int i = 0, j = 0; str[i] != '\0'; i++) {
        VGA_BUF[j] = str[i];
        j += 2;
    }
}
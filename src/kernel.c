extern void _start() {
    char *VGABUF = (char *)0xB8000;
    VGABUF[0] = 'H';
    VGABUF[2] = 'e';
    VGABUF[4] = 'l';
    VGABUF[6] = 'l';
    VGABUF[8] = 'o';
}
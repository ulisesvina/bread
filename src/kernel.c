#include "utils.c"

extern void _start() {
    unsigned char *VGA_MEM = (unsigned char*) (0xb8000);
    print("This shit is finally working :D");
    return;
}

/* 
    The code above is not by any means an actual kernel (it will be at some point though).
    For now, it's just me getting excited cause I was able to run C with Assembly and boot it.
*/
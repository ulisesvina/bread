#include "lib/stdio.h"

extern void _start(void)
{
    printf("This is an example used to demonstrate the new printf function and the VGA driver in the Bread operating system. In future versions, it's planned to add a keyboard kernel driver and a shell in order to execute programs. Also, it's in my plans to enlarge the stdio function so that it's a full I/O library, I'm also planning to port other common libraries used in C development (as stated in README.md). Stay tuned to see al the changes in Bread!");
}
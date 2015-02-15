#include <portio.h>
#include <driver/vga.h>
#include <user/user.h>

void _start() {
	vga_init();
	vga_write("x86os @ https://github.com/ponyatov/Azbuka/blob/master/Azbuka.pdf?raw=true\n\n");
	user();
}

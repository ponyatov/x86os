#include <portio.h>
#include <driver/vga.h>
#include <user/user.h>

void _start() {
	vga_init();
	for (;;)
		user();
}

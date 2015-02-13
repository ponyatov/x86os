// Std.VGA 80x25 text console driver

#include <driver/vga.h>

const unsigned char vga_cols = VGA_COLS;
const unsigned char vga_rows = VGA_ROWS;

unsigned char *vga_buf = (unsigned char *) (VGA_ADDR);
unsigned int vga_ptr = 0;

void vga_init() {
	vga_ptr = 0;
	for (int i = 0; i < VGA_COLS * 3 / 2; i++)
		vga_buf[vga_ptr++] = 0xFF;
}

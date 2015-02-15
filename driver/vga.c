// Std.VGA 80x25 text console driver

#include <stdint.h>
#include <driver/vga.h>

const uint8_t vga_cols = VGA_COLS;
const uint8_t vga_rows = VGA_ROWS;

uint8_t *vga_buf = (unsigned char *) (VGA_ADDR);

uint8_t vga_fg=COLOR_GREEN;
uint8_t vga_bg=COLOR_BLACK;

uint8_t vga_cursor_row=0;
uint8_t vga_cursor_col=0;

void vga_init() {
	vga_cursor_row=0;
	vga_cursor_col=0;
}

void vga_write(char *msg) {

}

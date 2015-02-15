// Std.VGA 80x25 text console driver

#include <stdint.h>
#include <driver/vga.h>

const uint8_t vga_cols = VGA_COLS;
const uint8_t vga_rows = VGA_ROWS;

uint8_t *vga_buf = (uint8_t *) (VGA_ADDR);

uint8_t vga_fg = COLOR_WHITE;
uint8_t vga_bg = COLOR_DARK_GREY;

uint8_t vga_cursor_row = 0;
uint8_t vga_cursor_col = 0;

void vga_init() {
	vga_cursor_row = 0;
	vga_cursor_col = 0;
	for (int i = 0; i < VGA_COLS * VGA_ROWS; i++)
		vga_buf[i * 2 + 1] = COLOR_LIGHT_GREY | vga_bg << 4;
}

void vga_char(char c) {
	if (c == '\n') {
		while (vga_cursor_col > 0)
			vga_char(' ');
	} else {
		int ptr = vga_cursor_row * VGA_COLS + vga_cursor_col;
		vga_buf[ptr * 2 + 0] = c;
		vga_buf[ptr * 2 + 1] = vga_fg | vga_bg << 4;
		vga_cursor_col++;
		if (vga_cursor_col > VGA_COLS) {
			vga_cursor_col = 0;
			vga_cursor_row++;
			if (vga_cursor_row > VGA_ROWS)
				vga_cursor_row = 0;
		}
	}
}

void vga_write(char *msg) {
	for (int i = 0; i <= VGA_COLS * VGA_ROWS; i++) {
		if (msg[i] == 0x00)
			break;
		else
			vga_char(msg[i]);
	}
}

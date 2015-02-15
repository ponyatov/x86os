#ifndef _H_VGA
#define _H_VGA

#define VGA_COLS 80
#define VGA_ROWS 25

#define VGA_ADDR 0xB8000

enum vga_color {
	COLOR_BLACK =0,
	COLOR_BLUE =1,
	COLOR_GREEN =2,
	COLOR_CYAN =3
};

//	#define COLOR_RED = 4;
//	#define COLOR_MAGENTA = 5;
//	#define COLOR_BROWN = 6;
//	#define COLOR_LIGHT_GREY = 7;
//	#define COLOR_DARK_GREY = 8;
//	#define COLOR_LIGHT_BLUE = 9;
//	#define COLOR_LIGHT_GREEN = 10;
//	#define COLOR_LIGHT_CYAN = 11;
//	#define COLOR_LIGHT_RED = 12;
//	#define COLOR_LIGHT_MAGENTA = 13;
//	#define COLOR_LIGHT_BROWN = 14;
//	#define COLOR_WHITE = 15;
//};

void vga_init();

#endif

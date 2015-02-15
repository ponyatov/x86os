ENTRY(_multiboot)

SECTIONS {

. = 1M;		/* load @1Mb high mem */

.text BLOCK(4K) : ALIGN(4K) {
	*(.multiboot)
	*(.text)
}

.stack  BLOCK(4K) : ALIGN(4K) { *(.stack)  }
.rodata BLOCK(4K) : ALIGN(4K) { *(.rodata) }
.data   BLOCK(4K) : ALIGN(4K) { *(.data)   }
.bss    BLOCK(4K) : ALIGN(4K) { *(.bss)    }

/DISCARD/ : { *(.eh_frame) *(.comment) }

}

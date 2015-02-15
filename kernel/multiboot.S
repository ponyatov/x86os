// multiboot-compliant assembly start-up

.set MAGIC,    0x1BADB002		// multiboot signature
.set ALIGN,    1<<0				// page align memory segments
.set MEMINFO,  1<<1				// memory map
.set FLAGS,    ALIGN | MEMINFO
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

//.text
.global _multiboot
_multiboot:
	cli
	movl $stack_top, %esp
	call _start
	cli
.halt:
	hlt
	jmp .halt

.section .stack, "aw", @nobits
.skip 16*1024
stack_top:

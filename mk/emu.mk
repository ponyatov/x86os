.PHONY: emu
emu: kernel.elf
	qemu -m 2M -kernel $<

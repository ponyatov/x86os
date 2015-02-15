KERNEL =  kernel/multiboot.S
KERNEL += kernel/kernel.c

.PHONY: kernel
kernel: kernel.elf
kernel.elf: $(KERNEL) $(DRIVER) $(USER) $(HEADER) cfg.mk x86os.ld
	$(TCC) $(TCFLAGS) -o $@ $(KERNEL) $(DRIVER) $(USER)
	$(OBJDUMP) -xd $@ > kernel.objdump

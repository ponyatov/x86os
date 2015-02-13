KERNEL = kernel/kernel.c

.PHONY: kernel
kernel: kernel.elf
kernel.elf: $(KERNEL) $(DRIVER) $(USER) cfg.mk
	$(TCC) $(TCFLAGS) -o $@ $(KERNEL) $(DRIVER) $(USER) &&\
	$(OBJDUMP) -x $@ > $@.objdump

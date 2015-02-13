KERNEL = kernel/kernel.c

.PHONY: kernel
kernel: kernel.bin
kernel.bin: $(KERNEL) $(DRIVER) $(USER) cfg.mk
	$(TCC) $(TCFLAGS) -o $@ $(KERNEL) $(DRIVER) $(USER)

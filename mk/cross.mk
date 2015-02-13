
TARGET = $(CPU)-elf
.PHONY: cross
cross: binutils

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README


TARGET = $(CPU)-elf

CFG = configure --disable-nls --disable-werror \
	CC="ccache gcc -pipe" CFLAGS="-march=native -Ofast" \
	--infodir=$(TMP)/info --mandir=$(TMP)/man
	
CPU_CORES  = $(shell grep processor /proc/cpuinfo |wc -l)

MAKE = make -j$(CPU_CORES)
INSTALL  = make install

.PHONY: cross
cross: binutils

CFG_BINUTILS = --target=$(TARGET) --prefix=$(TC)
#	--enable-lto --disable-multilib

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(CFG) $(CFG_BINUTILS) &&\
	$(MAKE) && $(INSTALL)-strip

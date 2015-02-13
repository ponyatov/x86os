
TARGET = $(CPU)-elf

CFG = configure --disable-nls --disable-werror

.PHONY: cross
cross: binutils

CFG_BINUTILS = --target=$(TARGET) --prefix=$(TC) \
	--enable-lto --disable-multilib

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(CFG) $(CFG_BINUTILS) &&\
	make -j2 && make install-strip

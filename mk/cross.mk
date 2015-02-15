TARGET = $(CPU)-elf
CCACHE = ccache

CFG = configure --prefix=$(TC) --disable-nls --disable-werror \
	CC="$(CCACHE) gcc -pipe" \
	--infodir=$(TMP)/info --mandir=$(TMP)/man --docdir=$(TMP)/doc
	
.PHONY: cross
cross: binutils cclibs gcc

CFG_BINUTILS = --target=$(TARGET) --enable-lto \
	--with-sysroot=$(PWD) --with-native-system-header-dir=/include

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(CFG) $(CFG_BINUTILS) &&\
	$(MAKE) && $(INSTALL)-strip

include mk/cclibs.mk

CFG_GCC = $(CFG_BINUTILS) $(CFG_CCLIBS) \
	--without-headers --with-newlib \
	--enable-languages="c,c++"
	
.PHONY: gcc
gcc: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(CFG) $(CFG_GCC)
	cd $(TMP)/$(GCC) && $(MAKE) all-gcc
	cd $(TMP)/$(GCC) && $(MAKE) install-gcc
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgcc
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libgcc

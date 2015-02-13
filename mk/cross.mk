TARGET = $(CPU)-elf
CCACHE = ccache

CFG = configure --prefix=$(TC) --disable-nls --disable-werror \
	CC="$(CCACHE) gcc -pipe" \
	--infodir=$(TMP)/info --mandir=$(TMP)/man --docdir=$(TMP)/doc
	
.PHONY: cross
cross: binutils cclibs gcc

CFG_BINUTILS = --target=$(TARGET) 
#	--enable-lto --disable-multilib

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(CFG) $(CFG_BINUTILS) &&\
	$(MAKE) && $(INSTALL)-strip

CFG_CCLIBS = --disable-shared --with-gmp=$(TC)
.PHONY: cclibs
cclibs: gmp mpfr mpc

CFG_GMP = $(CFG_CCLIBS)
.PHONY: gmp
gmp: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) &&\
	cd $(TMP)/$(GMP) &&\
	$(SRC)/$(GMP)/$(CFG) $(CFG_GMP) &&\
	$(MAKE) && $(INSTALL)-strip

CFG_MPFR = $(CFG_CCLIBS)
.PHONY: mpfr
mpfr: $(SRC)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) &&\
	cd $(TMP)/$(MPFR) &&\
	$(SRC)/$(MPFR)/$(CFG) $(CFG_MPFR) &&\
	$(MAKE) && $(INSTALL)-strip

CFG_MPC = $(CFG_CCLIBS)
.PHONY: mpc
mpc: $(SRC)/$(MPC)/README
	rm -rf $(TMP)/$(MPC) && mkdir $(TMP)/$(MPC) &&\
	cd $(TMP)/$(MPC) &&\
	$(SRC)/$(MPC)/$(CFG) $(CFG_MPC) &&\
	$(MAKE) && $(INSTALL)-strip

CFG_GCC = $(CFG_BINUTILS) --enable-languages="c,c++" \
	--without-headers --with-newlib
	
.PHONY: gcc
gcc: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(CFG) $(CFG_GCC)

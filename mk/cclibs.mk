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

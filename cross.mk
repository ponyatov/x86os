
BINUTILS_VER	= 2.24
GMP_VER			= 5.1.3
MPFR_VER		= 3.1.2
MPC_VER			= 1.0.2
GCC_VER			= 4.9.1

BINUTILS		= binutils-$(BINUTILS_VER)
GMP				= gmp-$(GMP_VER)
MPFR			= mpfr-$(MPFR_VER)
MPC				= mpc-$(MPC_VER)
GCC				= gcc-$(GCC_VER)

WGET = wget -N -P gz
.PHONY: gz
gz:
	$(WGET) http://ftp.gnu.org/gnu/binutils/$(BINUTILS).tar.bz2
	$(WGET) http://gcc.skazkaforyou.com/releases/$(GCC)/$(GCC).tar.bz2
	$(WGET) ftp://ftp.gmplib.org/pub/gmp/$(GMP).tar.bz2
	$(WGET) http://www.mpfr.org/mpfr-current/$(MPFR).tar.bz2
	$(WGET) http://www.multiprecision.org/mpc/download/$(MPC).tar.gz

TARGET = $(CPU)-elf
.PHONY: cross
cross:

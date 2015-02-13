WGET = wget -N -P gz

CPU_CORES  = $(shell grep processor /proc/cpuinfo |wc -l)

MAKE = make -j$(CPU_CORES)
INSTALL  = make install



CPU = i486

.PHONY: all  
all:

.PHONY: clean
clean:

TC = $(CPU).tc
DIRS = $(TC)

.PHONY: dirs
dirs:
	mkdir -p $(DIRS)

include cross.mk

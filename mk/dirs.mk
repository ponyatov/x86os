GZ = $(PWD)/gz
TC = $(PWD)/$(CPU).tc
SRC = $(PWD)/src
TMP = $(PWD)/tmp

DIRS = $(GZ) $(TC) $(SRC) $(TMP)
.PHONY: dirs
dirs:
	mkdir -p $(DIRS)

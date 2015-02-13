GZ = $(PWD)/gz
TC = $(PWD)/$(CPU).cross
SRC = $(PWD)/src
TMP = $(PWD)/tmp

DIRS = $(GZ) $(TC) $(SRC) $(TMP)
.PHONY: dirs
dirs:
	mkdir -p $(DIRS)

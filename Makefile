include cfg.mk

.PHONY: all  
all:

.PHONY: clean
clean:

include mk/versions.mk
include mk/packages.mk
include mk/dirs.mk
include mk/commands.mk
include mk/src.mk
include mk/cross.mk
include user/user.mk
include driver/driver.mk
include kernel/kernel.mk

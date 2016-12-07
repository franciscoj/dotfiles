BASH := $(shell command -v bash 2>/dev/null)

ifdef BASH
INSTALLERS += bash
CLEANERS   += clean_bash

BASHRC_SRC  := $(DOTFILES)/bash/bashrc
BASHRC      := $(DST_DIR)/.bashrc

.PHONY: bash clean_bash

bash: banner_install_bash $(BASHRC)

$(BASHRC):
	$(LINK) $(BASHRC_SRC) $@

clean_bash: banner_clean_bash
	$(RM) $(BASHRC)

endif



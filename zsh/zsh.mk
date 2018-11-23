ZSH := $(shell command -v zsh 2>/dev/null)

ifdef ZSH
INSTALLERS += zsh
CLEANERS   += clean_zsh

ZSHRC_SRC  := $(DOTFILES)/zsh/zshrc
ZSHRC      := $(DST_DIR)/.zshrc
ZSHENV_SRC := $(DOTFILES)/zsh/zshenv
ZSHENV     := $(DST_DIR)/.zshenv
ZPROFILE   := $(DST_DIR)/.zprofile

.PHONY: zsh clean_zsh

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
zsh: banner_install_zsh $(ZSHRC) $(ZPROFILE)
$(ZPROFILE):
	$(LINK) $(ZSHENV_SRC) $@
else
zsh: banner_install_zsh $(ZSHRC) $(ZSHENV)
$(ZSHENV):
	$(LINK) $(ZSHENV_SRC) $@
endif


$(ZSHRC):
	$(LINK) $(ZSHRC_SRC) $@

clean_zsh: banner_clean_zsh
	$(RM) $(ZSHRC)
ifeq ($(UNAME_S),Darwin)
	$(RM) $(ZPROFILE)
else
	$(RM) $(ZSHENV)
endif

endif



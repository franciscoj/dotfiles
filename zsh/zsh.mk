ZSH := $(shell command -v zsh 2>/dev/null)

ifdef ZSH
INSTALLERS += zsh
CLEANERS   += clean_zsh

ZSHRC_SRC         := $(DOTFILES)/zsh/zshrc
ZSHRC             := $(DST_DIR)/.zshrc
ZSHENV_SRC        := $(DOTFILES)/zsh/zshenv
ZSHENV            := $(DST_DIR)/.zshenv

.PHONY: zsh clean_zsh

zsh: banner_install_zsh $(ZSHRC) $(ZSHENV)

$(ZSHRC):
	$(LINK) $(ZSHRC_SRC) $@

$(ZSHENV):
	$(LINK) $(ZSHENV_SRC) $@

clean_zsh: banner_clean_zsh
	$(RM) $(ZSHRC)
	$(RM) $(ZSHENV)

endif



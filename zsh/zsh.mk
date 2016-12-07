ZSH := $(shell command -v zsh 2>/dev/null)

ifdef ZSH
INSTALLERS += zsh
CLEANERS   += clean_zsh

ZSHRC_SRC     := $(DOTFILES)/zsh/zshrc
ZSHRC         := $(DST_DIR)/.zshrc
ZPROFILE_SRC  := $(DOTFILES)/zsh/zprofile
ZPROFILE      := $(DST_DIR)/.zprofile

.PHONY: zsh clean_zsh

zsh: banner_install_zsh $(ZSHRC) $(ZPROFILE)

$(ZSHRC):
	$(LINK) $(ZSHRC_SRC) $@

$(ZPROFILE):
	$(LINK) $(ZPROFILE_SRC) $@

clean_zsh: banner_clean_zsh
	$(RM) $(ZSHRC)
	$(RM) $(ZPROFILE)

endif



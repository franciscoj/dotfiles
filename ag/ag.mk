AG := $(shell command -v ag 2>/dev/null)

ifdef AG
INSTALLERS += ag
CLEANERS   += clean_ag

AGIGNORE_SRC := $(DOTFILES)/ag/agignore
AGIGNORE      := $(DST_DIR)/.agignore

.PHONY: ag clean_ag

ag: banner_install_ag $(AGIGNORE)

$(AGIGNORE):
	$(LINK) $(AGIGNORE_SRC) $@

clean_ag: banner_clean_ag
	$(RM) $(AGIGNORE)

endif


RUBY := $(shell command -v ruby 2>/dev/null)

ifdef RUBY
INSTALLERS += ruby
CLEANERS   += clean_ruby

GEMRC_SRC := $(DOTFILES)/ruby/gemrc
GEMRC_DST := $(DST_DIR)/.gemrc
IRBRC_SRC := $(DOTFILES)/ruby/irbrc
IRBRC_DST := $(DST_DIR)/.irbrc

.PHONY: ruby clean_ruby

ruby: banner_install_ruby $(GEMRC_DST) $(IRBRC_DST)

$(GEMRC_DST):
	$(LINK) $(GEMRC_SRC) $@

$(IRBRC_DST):
	$(LINK) $(IRBRC_SRC) $@

clean_ruby: banner_clean_ruby
	$(RM) $(GEMRC_DST)
	$(RM) $(IRBRC_DST)

endif


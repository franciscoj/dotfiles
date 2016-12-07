I3STATUS := $(shell command -v i3status 2>/dev/null)

ifdef I3STATUS
INSTALLERS += i3status
CLEANERS   += clean_i3status

I3STATUS_SRC_CONFIG := $(DOTFILES)/i3status/config
I3STATUS_CONFIG  := $(CONFIG_DIR)/i3status/config

.PHONY: i3status clean_i3status

i3status: banner_install_i3status $(I3STATUS_CONFIG)

$(I3STATUS_CONFIG):
	$(MKDIR) $(@D)
	$(LINK) $(I3STATUS_SRC_CONFIG) $@

clean_i3status: banner_clean_i3status
	$(RM) $(I3STATUS_CONFIG)

endif


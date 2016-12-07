I3 := $(shell command -v i3 2>/dev/null)

ifdef I3
INSTALLERS += i3
CLEANERS   += clean_i3

I3_SRC_CONFIG := $(DOTFILES)/i3/config
I3_CONFIG  := $(CONFIG_DIR)/i3/config

.PHONY: i3 clean_i3

i3: banner_install_i3 $(I3_CONFIG)

$(I3_CONFIG):
	$(MKDIR) $(@D)
	$(LINK) $(I3_SRC_CONFIG) $@

clean_i3: banner_clean_i3
	$(RM) $(I3_CONFIG)

endif

INSTALLERS += bin
CLEANERS   += clean_bin

BIN_SRC_DIR  := $(DOTFILES)/bin
BIN_DST_DIR  := $(DST_DIR)/bin

.PHONY: bin clean_bin

bin: banner_install_bin $(BIN_DST_DIR)

$(BIN_DST_DIR):
	$(LINK) $(BIN_SRC_DIR) $@

clean_bin: banner_clean_bin
	$(RM) $(BIN_DST_DIR)
all: apply

install:
	./install.sh

apply:
	chezmoi apply -v

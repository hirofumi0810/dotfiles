SHELL=/bin/bash

.PHONY: all
all: install zsh vim tmux

.PHONY: clean
clean:
	cd zsh && make clean && \
	cd ../tmux && make clean && \
	cd ../vim && make clean

.PHONY: install
install:
	cd install && make init

.PHONY: zsh
zsh:
	cd zsh && make init

.PHONY: tmux
tmux:
	cd tmux && make init

.PHONY: vim
vim:
	cd vim && make init
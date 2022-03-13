SHELL=/bin/bash

.PHONY: all
all: install zsh vim tmux python

.PHONY: clean
clean:
	cd zsh && make clean && \
	cd ../vim && make clean && \
	cd ../tmux && make clean && \
	cd ../python && make clean

.PHONY: install
install:
	cd install && make init

.PHONY: zsh
zsh:
	cd zsh && make init

.PHONY: vim
vim:
	cd vim && make init

.PHONY: tmux
tmux:
	cd tmux && make init

.PHONY: python
python:
	cd python && make init
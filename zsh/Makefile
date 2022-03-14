SHELL = /bin/bash

.PHONY: init
init:
	sh -c "$(curl -fsSL https://git.io/zinit-install)" && \
	ln -sf ${PWD}/.zshenv ${HOME}/.zshenv && \
    ln -sf ${PWD}/.zsh ${HOME}/.zsh && \
	source ${HOME}/.zsh/.zshrc && \
	zinit self-update

.PHONY: clean
clean:
	unlink ${HOME}/.zshenv || true && \
	unlink ${HOME}/.zsh || true && \
	rm -rf ${HOME}/.local/share/zinit || true
.PHONY: init
init:
	ln -sf ${PWD}/.zshenv ${HOME}/.zshenv && \
    ln -sf ${PWD}/.zsh ${HOME}/.zsh

.PHONY: clean
clean:
	unlink ${HOME}/.zshenv || true && \
	unlink ${HOME}/.zsh || true
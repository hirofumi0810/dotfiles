SHELL = /bin/bash

.PHONY: init
init:
	ln -sf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tmux-sensible ${HOME}/.tmux/plugins/tmux-sensible
	git clone https://github.com/dracula/tmux ${HOME}/.tmux/plugins/tmux
	git clone https://github.com/tmux-plugins/tmux-resurrect ${HOME}/.tmux/plugins/tmux-resurrect
	git clone https://github.com/tmux-plugins/tmux-resurrect ${HOME}/.tmux/plugins/tmux-continuum

.PHONY: clean
clean:
	unlink ${HOME}/.tmux.conf || true && \
	rm -rf ${HOME}/.tmux || true
.PHONY: init
init:
	ln -sf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
	git clone https://github.com/dracula/tmux ~/.tmux/plugins/tmux
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-continuum

.PHONY: clean
clean:
	unlink ${HOME}/.tmux.conf || true && \
	rm -rf ~/.tmux/ || true
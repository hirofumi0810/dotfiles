.PHONY: init
init:
	ln -sf .vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.vim/colors
	mkdir -p ${HOME}/.vim/backup
	git clone https://github.com/altercation/vim-colors-solarized
	mv vim-colors-solarized/colors/solarized.vim ${HOME}/.vim/colors/
	rm -rf vim-colors-solarized

.PHONY: clean
clean:
	unlink ${HOME}/.vimrc || true && \
	rm -rf ${HOME}/.vim || true
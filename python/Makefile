SHELL = /bin/bash

.PHONY: init
init:
	. ./install_miniconda.sh ${HOME}/miniconda3 default 3.9

.PHONY: clean
clean:
	rm -rf ${HOME}/miniconda3 || true && \
	rm ${PWD}/miniconda.sh || true
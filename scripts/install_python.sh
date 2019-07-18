#!/bin/bash

# install pyenv
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc
source $HOME/.bashrc
# # NOTE: reboot terminal here
pyenv install -l | grep anaconda
pyenv install anaconda3-5.3.1
# pyenv install anaconda2-5.3.1
pyenv rehash
pyenv global anaconda3-5.3.1

# TODO: set conda path

# update conda itself
conda update conda

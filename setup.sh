#!/bin/bash

CURRENT_DIR=$(pwd)

# 1. homebrew(OSX) or apt(Linux)
if [ $(uname) \=\= 'Darwin' ]; then
  $CURRENT_DIR/scripts/install_homebrew.sh
else
  $CURRENT_DIR/scripts/install_apt.sh
fi

# 2. zsh
chsh -s $(which zsh)
exec $SHELL -l
# NOTE: still bash until reboot

# 3. vim
mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.vim/backup
git clone https://github.com/altercation/vim-colors-solarized
mv ./vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/
rm -rf ./vim-colors-solarized

# 4. python
$CURRENT_DIR/scripts/install_python.sh

# 5. set paths
ln -sf $CURRENT_DIR/.vimrc $HOME/.vimrc
ln -sf $CURRENT_DIR/.zshenv $HOME/.zshenv
ln -sf $CURRENT_DIR/.zsh $HOME/.zsh
ln -sf $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf

# 6. atom
$CURRENT_DIR/scripts/install_atom.sh

# 7. github
git config --global user.email "hiro.mhbc@gmail.com"
git config --global user.name "Hirofumi Inaguma"

# comment out the below command
# sudo reboot

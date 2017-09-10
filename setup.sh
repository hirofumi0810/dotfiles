#!/bin/bash

CURRENT_DIR=`pwd`

# 1. homebrew(OSX) or apt(Linux)
if [ `uname` \=\= 'Darwin' ] ; then
  chmod +x $CURRENT_DIR/scripts/install_homebrew.sh
  $CURRENT_DIR/scripts/install_homebrew.sh
else
  chmod +x $CURRENT_DIR/scripts/install_apt.sh
  $CURRENT_DIR/scripts/install_apt.sh
fi


# 2. zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh


# 3. vim
mkdir -p ~/.vim
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup
git clone https://github.com/altercation/vim-colors-solarized
mv ./vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf ./vim-colors-solarized


# 4. python
chmod +x $CURRENT_DIR/scripts/install_python.sh
$CURRENT_DIR/scripts/install_python.sh


# 5. set paths
ln -sf $CURRENT_DIR/.vimrc ~/.vimrc
ln -sf $CURRENT_DIR/.zshenv ~/.zshenv
ln -sf $CURRENT_DIR/.zsh ~/.zsh
ln -sf $CURRENT_DIR/.tmux.conf ~/.tmux.conf


# 6. atom
chmod +x $CURRENT_DIR/scripts/install_atom.sh
$CURRENT_DIR/scripts/install_atom.sh


# 7. github
# comming soon

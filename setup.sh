#!/bin/bash

# 1. homebrew(OSX) or apt(Linux)
if [ `uname` \=\= 'Darwin' ] ; then
  chmod 755 install_homebrew.sh
  ./install_homebrew.sh
else
  chmod 755 install_apt.sh
  ./install_apt.sh
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
chmod 755 install_python.sh
./install_python.sh


# 5. set paths
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zsh ~/.zsh
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf


# 6. atom
# comming soon


# 7. github
# comming soon
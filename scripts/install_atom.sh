#!/bin/zsh

if [ `uname` \=\= "Darwin" ] ; then
  # OSX
  wget https://atom.io/download/mac.zip ~/
  unzip ~/mac.zip
  rm ~/mac.zip
  sudo mv ~/Atom.app ~/../Applications/
else
  # Linux
  echo 'comming soon'
fi

# apm install
apm install --packages-file ~/dotfiles/atom/atomfile

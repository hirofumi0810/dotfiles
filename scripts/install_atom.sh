#!/bin/zsh

CURRENT_DIR=`pwd`

if [ `uname` \=\= "Darwin" ] ; then
  # OSX
  wget https://atom.io/download/mac.zip $CURRENT_DIR/
  unzip $CURRENT_DIR/mac.zip
  rm $CURRENT_DIR/mac.zip
  sudo mv $CURRENT_DIR/Atom.app /Users/Applications/
else
  # Linux
  echo 'comming soon'
fi

# apm install
apm install --packages-file $CURRENT_DIR/dotfiles/atom/atomfile

#!/bin/bash

if [ $(uname) != 'Darwin' ]; then
    exit 0
fi

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
# if you cannot update brew, try "git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/ fetch --unshallow"

# brew install
brew install tmux
# brew install --disable-etcdir zsh
brew install zsh
brew install zsh-completions
brew install reattach-to-user-namespace
brew install vim
brew install git
brew install colordiff
brew install wget
brew install sqlite
brew install tree
brew install watch
brew install node
# brew install caskroom/cask/brew-cask
brew install peco
brew install node
brew install pyenv
brew install pyenv-virtualenv

# upgrade
brew upgrade tmux
brew upgrade zsh
brew upgrade zsh-completions
brew upgrade reattach-to-user-namespace
brew upgrade vim
brew upgrade git
brew upgrade colordiff
brew upgrade wget
brew upgrade sqlite
brew upgrade tree
brew upgrade watch
brew upgrade node
# brew upgrade caskroom/cask/brew-cask
brew upgrade peco
brew upgrade node
brew upgrade pyenv
brew upgrade pyenv-virtualenv

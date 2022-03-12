#!/bin/bash

if [ $(uname) \=\= 'Darwin' ]; then
    exit 0
fi

sudo apt-get update
sudo apt-get -y upgrade

# sudo apt-get install ***
sudo apt-get install zsh
sudo apt-get install git
sudo apt-get install tmux
sudo apt-get install --assume-yes xclip
sudo apt install xsel
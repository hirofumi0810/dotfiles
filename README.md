# My dotfiles

### Installation
You can conduct setup by
```
./setup.sh
```

or by commanding step by step as follows:

#### 1. homebrew
##### OSX
- install homebrew
- update brew
- install some brew packages (including tmux, zsh, and pyenv)

```
CURRENT_DIR=$(pwd)
$CURRENT_DIR/scripts/install_homebrew.sh
```

##### Linux

```
$CURRENT_DIR/scripts/install_apt.sh
```


#### 2. zsh
- change shell from bash to zsh (if possiple)

```
chsh -s $(which zsh)
exec $SHELL -l
```


#### 3. vim
- install solarized

```
mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.vim/backup
git clone https://github.com/altercation/vim-colors-solarized
mv ./vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/
rm -rf ./vim-colors-solarized
```


#### 4. python setting
- install anaconda
- install some pip packages
- install some deep learning toolkits

```
$CURRENT_DIR/scripts/install_python.sh
```


#### 5. path setting
- set paths of vim, zsh, and tmux

```
ln -sf $CURRENT_DIR/.vimrc $HOME/.vimrc
ln -sf $CURRENT_DIR/.zshenv $HOME/.zshenv
ln -sf $CURRENT_DIR/.zsh $HOME/.zsh
ln -sf $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf
```


#### 6. atom
- install atom
- install apm packages

```
$CURRENT_DIR/scripts/install_atom.sh
```


#### 7. github

```
git config --global user.email "your e-mail address"
git config --global user.name "your name"
```


### Dependency
- homebrew
- zsh
- tmux
- vim
- peco
- atom


### Contact
hiro.mhbc@gmail.com

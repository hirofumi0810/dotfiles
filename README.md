# My dotfiles

### Installation
You can conduct setup by
```
chmod +x setup.sh
./setup.sh
```

or by commanding as follows:

#### 1. homebrew
##### OSX
- install homebrew
- update brew
- install some brew packages (including tmux, zsh, and pyenv)

Command
```
CURRENT_DIR=`pwd`
chmod +x $CURRENT_DIR/scripts/install_homebrew.sh
$CURRENT_DIR/scripts/install_homebrew.sh
```

##### Linux

Command
```
chmod +x $CURRENT_DIR/scripts/install_apt.sh
$CURRENT_DIR/scripts/install_apt.sh
```


#### 2. zsh
- change shell from bash to zsh (if possiple)

Command
```
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh
```


#### 3. vim
- install solarized

Command
```
mkdir -p ~/.vim
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup
git clone https://github.com/altercation/vim-colors-solarized
mv ./vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf ./vim-colors-solarized
```


#### 4. python setting
- install anaconda
- install some pip packages
- install some deep learning toolkits

Command
```
chmod +x $CURRENT_DIR/scripts/install_python.sh
$CURRENT_DIR/scripts/install_python.sh
```


#### 5. path setting
- set paths of vim, zsh, and tmux

Command
```
ln -sf $CURRENT_DIR/.vimrc ~/.vimrc
ln -sf $CURRENT_DIR/.zshenv ~/.zshenv
ln -sf $CURRENT_DIR/.zsh ~/.zsh
ln -sf $CURRENT_DIR/.tmux.conf ~/.tmux.conf
```


#### 6. atom
- install atom
- install apm packages

Command
```
chmod +x $CURRENT_DIR/scripts/install_atom.sh
$CURRENT_DIR/scripts/install_atom.sh
```


#### 7. github
- comming soon


### Dependency
- homebrew
- zsh
- tmux
- vim
- peco
- atom


### Contact
hiro.mhbc@gmail.com

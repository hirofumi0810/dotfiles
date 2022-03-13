# My dotfiles

### Installation
You can conduct setup by
```
make
```

or by commanding step by step as follows:

#### 1. homebrew / apt
- install zsh, vim, tmux, git etc.

##### OSX
- install homebrew
- update brew
- install brew packages (including tmux, zsh, and pyenv etc.)

```
cd install && make
```

##### Linux

```
cd install && make
```


#### 2. zsh
- change shell from bash to zsh (if possible)

```
cd zsh && make
sudo reboot
```


#### 3. vim
- install solarized

```
cd vim && make
```


#### 4. tmux
- setup for tmux configuration (tmux installation is not included)

```
cd tmux && make
```


#### 5. miniconda
- install python enviroment via miniconda

```
cd python && make
```


### Dependency
- homebrew (OSX) / apt (Linux)
- zsh
- tmux
- vim
- miniconda


### Contact
hiro.mhbc@gmail.com

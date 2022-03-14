# My dotfiles

## Installation

You can conduct all setups by

```bash
#!/bin/bash
make
```

or step by step as follows:

### 1. homebrew / apt

- Install zsh, vim, tmux, git etc.

```bash
#!/bin/bash
cd install && make
```

### 2. zsh

- Setup for zsh configuration (zsh installation is not included)

```bash
#!/bin/bash
cd zsh && make
sudo reboot

```

### 3. vim

- Setup for vim configuration (vim installation is not included)

```bash
#!/bin/bash
cd vim && make
```

### 4. tmux

- Setup for tmux configuration (tmux installation is not included)

```bash
#!/bin/bash
cd tmux && make
```

### 5. miniconda

- Install python/conda environment via miniconda

```bash
#!/bin/bash
cd python && make
```

### 6. peco

- Install peco (Linux)
- peco is installed in `install` by default. If it is impossible to use apt for Linux, command as follows:

```bash
#!/bin/bash
cd peco && make
```

### Dependency

- homebrew (OSX) / apt (Linux)
- zsh
- tmux
- vim
- miniconda
- peco

### Contact

hiro.mhbc@gmail.com

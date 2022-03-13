if [ $(uname) = 'Darwin' ]; then
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ${HOME}/.zsh/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi

    # reference: https://github.com/romkatv/powerlevel10k/issues/1203
    if [ -z "${TMUX}" ]; then
      exec tmux new-session -A -s workspace
    fi
elif [ $(uname) = 'Linux' ]; then
    source /etc/profile
fi

######################################################################
# 全般
######################################################################
# 環境変数
export LANG=ja_JP.UTF-8

# カラーを有効化
autoload -Uz colors
colors

# カレントディレクトリの表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# emacs風キーバインドにする
bindkey -e

# 読み込むテーマを指定
ZSH_THEME="prompt"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# 文字コード
LANG=ja_JP.UTF-8
LC_CTYPE=ja_JP.UTF-8
LANG=ja_JP.UTF-8
LC_ALL=ja_JP.UTF-8

# ページャー
PAGER=less

# ウインドウ名の表示
set -g set-titles on
set -g set-titles-string '#W'

######################################################################
# option
######################################################################
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beepを無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#'以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cdしたら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# 賢いmvを有効にする
autoload zmv


### Added by Zinit's installer
if [[ ! -f ${HOME}/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "${HOME}/.local/share/zinit" && command chmod g-rwX "${HOME}/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "${HOME}/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


######################################################################
# module
######################################################################
[ -f ${ZDOTDIR}/.zshrc_path_common ] && . ${ZDOTDIR}/.zshrc_path_common
[ -f ${ZDOTDIR}/.zshrc_path_$(uname) ] && . ${ZDOTDIR}/.zshrc_path_$(uname)
[ -f ${ZDOTDIR}/.zshrc_alias_common ] && . ${ZDOTDIR}/.zshrc_alias_common
[ -f ${ZDOTDIR}/.zshrc_alias_$(uname) ] && . ${ZDOTDIR}/.zshrc_alias_$(uname)
[ -f ${ZDOTDIR}/.zshrc_comp ] && . ${ZDOTDIR}/.zshrc_comp
[ -f ${ZDOTDIR}/.zshrc_func ] && . ${ZDOTDIR}/.zshrc_func
[ -f ${ZDOTDIR}/.zshrc_history ] && . ${ZDOTDIR}/.zshrc_history
[ -f ${ZDOTDIR}/.zshrc_tmux ] && . ${ZDOTDIR}/.zshrc_tmux
[ -f ${ZDOTDIR}/.zshrc_plugin ] && . ${ZDOTDIR}/.zshrc_plugin
[ -f ${ZDOTDIR}/.zshrc_ssh ] && . ${ZDOTDIR}/.zshrc_ssh

# To customize prompt, run `p10k configure` or edit ${HOME}/.zsh/.p10k.zsh.
[[ ! -f ${HOME}/.zsh/.p10k.zsh ]] || source ${HOME}/.zsh/.p10k.zsh
# If you want to change the setting, command "p10k configure"

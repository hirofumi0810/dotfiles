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

# emacs 風キーバインドにする
bindkey -e

# 読み込むテーマを指定
ZSH_THEME="prompt"

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
# 補完
######################################################################
# 補完機能強化（for zsh-completions）
fpath=(/usr/local/share/zsh-completions $fpath)

# 補完機能を有効化
autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドラインの引数でも補完を有効にする
setopt magic_equal_subst

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'



######################################################################
# 履歴
######################################################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks


######################################################################
# オプション
######################################################################
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# 賢いmvを有効にする
autoload zmv


######################################################################
# tmuxとの連携
######################################################################
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session


######################################################################
# エイリアス
######################################################################
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# ls
case ${OSTYPE} in
    darwin*)
        # Mac
        export CLICOLOR=1
        alias ls='ls -F -G'
        alias la='ls -a -F -G'
        alias ll='ls -al -F -G'
        ;;
    linux*)
        # Linux
        alias ls='ls -F --color=auto'
        alias la='ls -a -F --color=auto'
        alias ll='ls -sl -F --color=auto'
        ;;
esac

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
fi

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# Sublime Text 3
# alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# ssh
alias internbaito_hiro='ssh -i ~/.ssh/internbaito_developer.pem hiro@52.196.116.27'
alias internbaito_kazuki='ssh -i ~/.ssh/internbaito_developer.pem kazuki@52.196.116.27'

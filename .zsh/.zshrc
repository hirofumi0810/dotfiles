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


######################################################################
# module
######################################################################
[ -f $ZDOTDIR/.zshrc_path.common ] && . $ZDOTDIR/.zshrc_path.common
[ -f $ZDOTDIR/.zshrc_path.$(uname) ] && . $ZDOTDIR/.zshrc_path.$(uname)
[ -f $ZDOTDIR/.zshrc_alias.common ] && . $ZDOTDIR/.zshrc_alias.common
[ -f $ZDOTDIR/.zshrc_alias.$(uname) ] && . $ZDOTDIR/.zshrc_alias.$(uname)
[ -f $ZDOTDIR/.zshrc_comp ] && . $ZDOTDIR/.zshrc_comp
[ -f $ZDOTDIR/.zshrc_func ] && . $ZDOTDIR/.zshrc_func
[ -f $ZDOTDIR/.zshrc_history ] && . $ZDOTDIR/.zshrc_history
[ -f $ZDOTDIR/.zshrc_tmux ] && . $ZDOTDIR/.zshrc_tmux
[ -f $ZDOTDIR/.zshrc_ssh ] && . $ZDOTDIR/.zshrc_ssh


######################################################################
# anaconda setting
######################################################################
if [ $(hostname) = 'arcs22' ]; then
  echo 'Entering to conda env in arcs22...'
  sleep 1
  source activate arcs22
elif [ $(hostname) = 'arcs23' ]; then
  echo 'Entering to conda env in arcs23...'
  sleep 1
  source activate arcs23
elif [ $(hostname) = 'arcs24' ]; then
  echo 'Entering to conda env in arcs24...'
  sleep 1
  source activate arcs24
elif [ $(hostname) = 'arcs25' ]; then
  echo 'Entering to conda env in arcs25...'
  sleep 1
  source activate arcs25
elif [ $(hostname) = 'amgp00' ]; then
  echo 'Entering to conda env in amgp00...'
  sleep 1
  source activate amgp00
fi

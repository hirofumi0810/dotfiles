" カラースキーマ
syntax enable
set background=dark
colorscheme solarized

" 新しい行のインデントを現在行と同じにする
set autoindent

" バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.vim/backup

" クリップボードをWindowsと連携する
set clipboard=unnamed

" vi互換をオフする
set nocompatible

" スワップファイル用のディレクトリを指定する
set directory=$HOME/.vim/backup

" タブの代わりに空白文字を指定する
set expandtab

" タブ幅の設定
set tabstop=4

" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

" インクリメンタルサーチを行う
set incsearch

" 行番号を表示する
set number

" 閉括弧が入力された時、対応する括弧を強調する
set showmatch

" 新しい行を作った時に高度な自動インデントを行う
set smarttab

" 新しい行を作った時に高度な自動インデントを行う
set smarttab

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrepやgrep した際に、cwindowしてしまう
autocmd QuickFixCmdPost *grep* cwindow

" エスケープシーケンスの表示 tab eol
set list
set listchars=tab:▸\ ,eol:¬

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        "ZenkakuSpace をカラーファイルで設定するなら、
        "次の行をコメントアウト
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


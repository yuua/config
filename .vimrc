set nocompatible
filetype off

" vundle {{{

	set rtp+=~/.vim/vimfiles/vundle.git/
	call vundle#rc()

	"utility {{{

	Bundle 'grep.vim'

	"}}} end utility

	"syntax {{{

	Bundle 'jQuery'
	Bundle 'yuroyoro/vim-python'
	Bundle 'haml.zip'
	Bundle 'JavaScript-syntax'
	Bundle 'php.vim'

	"}}} end syntax

	syntax on
	filetype on
	filetype indent on
	filetype plugin on

" }}} end vundle

" Envelopment {{{

	if has("win32") || has("win64")
		let $VIMHOME = $VIM."/vimfiles"
	else
		let $VIMHOME = $HOME."/.vim"
	endif

"}}} Envelopment end

" python {{{
	autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
	autocmd FileType python setl autoindent
	autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
	autocmd FileType python setlocal sw=4 sts=4 ts=4 et
" }}} endindent

" setting {{{

	"auto encode set"
	set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp,default,latin

	"行数を表示"
	set number

	" タイトルをウインドウ枠に表示
	set title

	" ルーラーを表示
	set ruler

	" 括弧入力時の対応する括弧を表示
	set showmatch

	" 補完候補をリスト表示
	set wildmenu

	"入力中のコマンドをステータスに表示"
	set showcmd

	"スワップファイルを作成しない"
	set noswapfile

	"バックアップファイルを作成しない"
	set nobackup

	"改行表示"
	set list
	set listchars=tab:>-,eol:↓,trail:-

" }}} setting End

" ハイライト
if &t_Co > 2 || has("gui_running")
	"検索結果文字列のハイライトを有効にする
	set hlsearch
endif


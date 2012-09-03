set nocompatible
filetype off

" vundle {{{

	set rtp+=~/.vim/vimfiles/vundle.git/
	call vundle#rc()

	"utility {{{

	Bundle 'grep.vim'
	Bundle 'EnhCommentify.vim'
	Bundle 'thinca/vim-quickrun'
	Bundle 'yuroyoro/vim-autoclose'
	Bundle 'tpope / vim-rails'
	"}}} end utility

	"syntax {{{

	Bundle 'jQuery'
	Bundle 'yuroyoro/vim-python'
	Bundle 'haml.zip'
	Bundle 'JavaScript-syntax'
	Bundle 'php.vim'
	Bundle 'vim-ruby/vim-ruby'
	Bundle 'tpope/vim-rails'

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

" indent {{{
	autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
	autocmd FileType python setl autoindent
	autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
	autocmd FileType python setlocal sw=4 sts=4 ts=4 et
	autocmd FileType ruby   setlocal sw=2 sts=2 ts=2 et
	autocmd FileType eruby  setlocal sw=4 sts=4 ts=4 noet
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
	set listchars=tab:>-,trail:-

	"del & back key"
	set backspace=indent,eol,start

	"other set"
	set wildmenu
	set vb t_vb=

" }}} setting End

" ハイライト
if &t_Co > 2 || has("gui_running")
	"検索結果文字列のハイライトを有効にする
	set hlsearch
endif


set nocompatible
filetype off

" vundle {{{

	set rtp+=~/.vim/vimfiles/vundle.git/
	call vundle#rc()

	Bundle 'JavaScript-syntax'


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


" setting {{{

	"行数を表示"
	set number

	"入力中のコマンドをステータスに表示"
	set showcmd

	"スワップファイルを作成しない"
	set noswapfile

	"バックアップファイルを作成しない"
	set nobackup

" }}} setting End

"ack grep"
"Bundle 'ack.vim'"

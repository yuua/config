if &compatible
  set nocompatible
endif

filetype off

" dein vim
" dein cache dir
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein installing
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  " 起動時に読み込む
  let s:toml      = g:rc_dir . '/dein.toml'
  " 特定の条件で後から読み込む
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" 未インストールがあればインストール実行
if dein#check_install()
  call dein#install()
endif

" end dein vim

syntax on
filetype plugin indent on

" Envelopment

if has("win32") || has("win64")
  let $VIMHOME = $VIM."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

" Envelopment end

if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

" indent

autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby   setl autoindent
autocmd FileType ruby   setl expandtab
autocmd FileType ruby   setlocal sw=2 sts=2 ts=2 et
autocmd FileType eruby  setlocal sw=4 sts=4 ts=4 noet
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType json setlocal sw=2 sts=2 ts=2 et
autocmd FileType tpl setlocal sw=2 sts=2 ts=2 et
autocmd FileType php    setlocal sw=4 sts=4 ts=4 et
autocmd FileType tpl    setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml   setlocal sw=2 sts=2 ts=2 et

" endindent

let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化"
let g:rsenseUseOmniFunc = 1

let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}


if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

if isdirectory(dein#get('vim-scp-upload').path)
"if isdirectory($HOME . '/.vim/bundle/vim-scp-upload')
  source $HOME/.vimrc.office
  nnoremap <C-@> <ESC>:call ScpUpload()<CR>
endif

let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
nnoremap <C-_> <ESC>:NERDTree<CR>

" setting

set fileencodings=utf-8,euc-jp,eucjp-ms,euc-jisx0213,cp932,iso-2022-jp,default,latin

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

"search set"
set ignorecase
set smartcase
set incsearch
set nowrapscan
set history=1000

set clipboard=unnamed,autoselect

" setting End

" ハイライト
if &t_Co > 2 || has("gui_running")
  "検索結果文字列のハイライトを有効にする
  set hlsearch
endif


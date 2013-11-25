set showtabline=2
set transparency=5
set imdisable
set guioptions-=T
set antialias
set tabstop=4
set number
set nobackup
set visualbell t_vb=
set nowrapscan
set columns=200
set lines=60

if has('gui_macvim')
    map <silent> <C-p> :tabnext<CR>
    map <silent> <C-n> :tabprev<CR>

    map <silent> <C-e> :tabclose<CR>
endif


"" colorscheme
colorscheme molokai

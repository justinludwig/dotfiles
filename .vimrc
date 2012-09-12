set autoindent
set backspace=indent,eol,start
set colorcolumn=85
set diffopt=filler,context:4,icase
set directory=~/tmp/vim//,~/tmp//,/var/tmp/vim//,/var/tmp//,/tmp//
set expandtab
set hidden
set history=100
set hlsearch
set incsearch
set nobackup
set ruler
set scrolloff=3
set shiftwidth=4
set showcmd
set showmode
set softtabstop=4
set tabstop=4
set title
set wildmenu
set wildmode=list:longest

syntax enable
colorscheme justin
filetype plugin on

noremap ' `
noremap ` '
noremap - ;
noremap ; :
noremap j gj
noremap k gk
inoremap jj <ESC>

noremap <leader>v V`]
noremap <leader>s :SubstituteCase/\v\c
noremap <leader>S :%SubstituteCase/\v\c
noremap <leader>pa "ap
noremap <leader>pb "ab
noremap <leader>pc "ac

cmap w!! %!sudo tee > /dev/null %

if filereadable('/usr/share/vim-scripts/macros/closetag.vim')
    " au FileType html,xml,gsp source /usr/share/vim-scripts/macros/closetag.vim
    let g:closetag_html_style=1
    source /usr/share/vim-scripts/macros/closetag.vim
endif

set runtimepath^=~/.vim/bundle/*

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'r'

if has('gui_running')
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
    set ttyfast
endif


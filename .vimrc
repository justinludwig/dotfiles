set incsearch
set hlsearch
set nobackup
set directory=~/tmp//,/var/tmp//,/tmp//
set hidden
set history=100
set wildmenu
set wildmode=list:longest
set ruler
set showcmd
set showmode
set title
set scrolloff=3
set backspace=indent,eol,start
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set diffopt=filler,context:4,icase
syntax enable
colorscheme justin
filetype plugin on
nnoremap ' `
nnoremap ` '
cmap w!! %!sudo tee > /dev/null %
runtime macros/matchit.vim

if has('gui_running')
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
endif


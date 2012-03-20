set incsearch
set hlsearch
set nobackup
set directory=~/tmp/vim//,~/tmp//,/var/tmp/vim//,/var/tmp//,/tmp//
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
nnoremap - ;
nnoremap ; :
cmap w!! %!sudo tee > /dev/null %

if filereadable('/usr/share/vim-scripts/macros/closetag.vim')
    " au FileType html,xml,gsp source /usr/share/vim-scripts/macros/closetag.vim
    let g:closetag_html_style=1
    source /usr/share/vim-scripts/macros/closetag.vim
endif

if has('gui_running')
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
endif


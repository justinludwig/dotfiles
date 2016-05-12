set autoindent
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set diffopt=filler,context:4,icase
set directory=~/.cache/vim//,/var/tmp/vim//,/var/tmp//,/tmp//
set expandtab
set hidden
set history=100
set hlsearch
set incsearch
set laststatus=2
set nobackup
set ruler
set scrolloff=3
set shiftwidth=4
set showcmd
set showmode
set softtabstop=4
set tabstop=4
set title
set undofile
set undodir=~/.cache/vim//,/var/tmp/vim//,/var/tmp//,/tmp//
set wildmenu
set wildmode=list:longest

let mapleader=","

noremap ' `
noremap ` '
noremap - ;
noremap ; :
noremap j gj
noremap k gk
inoremap jj <ESC>
nmap <silent> ,/ :nohlsearch<CR>

noremap <leader>v V`]
noremap <leader>V `[v`]
noremap <leader>s :SubstituteCase/\v\c
noremap <leader>S :%SubstituteCase/\v\c
" 'xb = copy lines to clipboard / 'pb = paste lines from clipboard
map <leader>xb :w !xsel -ib<CR><CR>
map <leader>xp :w !xsel -ip<CR><CR>
map <leader>xs :w !xsel -is<CR><CR>
map <leader>pb :r!xsel -ob<CR>
map <leader>pp :r!xsel -op<CR>
map <leader>ps :r!xsel -os<CR>

noremap <leader>2 :set shiftwidth=2<CR>:set softtabstop=2<CR>
noremap <leader>csv :set filetype=csv<CR>
noremap <leader>txt :set filetype=text<CR>
noremap <leader>A :%ArrangeColumn
noremap <leader>u :GundoToggle<CR>
noremap <leader>w :StripWhitespace<CR>
noremap <leader>W :%StripWhitespace<CR>

noremap <space><space> :Unite
noremap <space>/ :Unite -immediately grep:.<CR>
noremap <space>b :Unite buffer<CR>
noremap <space>cb :UniteWithCursorWord -immediately buffer<CR>
noremap <space>cf :UniteWithCursorWord -immediately file_rec/async<CR>
noremap <space>cg :UniteWithCursorWord -immediately grep<CR>
noremap <space>f :Unite file_rec/async<CR>
noremap <space>gd :Unite grails/domain<CR>
noremap <space>gc :Unite grails/controllers<CR>
noremap <space>gs :Unite grails/services<CR>
noremap <space>gt :Unite grails/taglib<CR>
noremap <space>gg :Unite grails/src<CR>
noremap <space>gu :Unite grails/test_unit<CR>
noremap <space>gi :Unite grails/test_integration<CR>
noremap <space>gf :Unite grails/test_functional<CR>
noremap <space>gl :Unite grails/css<CR>
noremap <space>gj :Unite grails/js<CR>
noremap <space>m :Unite -immediately buffer:+<CR>
noremap <space>r :Unite register<CR>
noremap <space>vc :Unite -default-action=open vcs/changeset<CR>
noremap <space>vf :Unite vcs/file_rec<CR>
noremap <space>vl :Unite vcs/log<CR>
noremap <space>vs :Unite -default-action=open vcs/status<CR>
noremap <space>y :Unite history/yank<CR>

cmap w!! w !sudo tee >/dev/null %

autocmd bufenter /dev/* set noswapfile
autocmd bufenter /run/* set noswapfile
autocmd bufenter /dev/* set noundofile
autocmd bufenter /run/* set noundofile

if &readonly
    set statusline=%f
    set statusline+=%=
    set statusline+=\ %c
    set statusline+=\ %l/%L
    set statusline+=\ %p%%
endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug/
set nocompatible
call plug#begin('~/.config/nvim/plugged')

Plug 'Align'
Plug 'bkad/CamelCaseMotion'

Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

"Plugin 'chrisbra/csv.vim'
"let g:csv_arrange_leftalign = 1
"let g:csv_highlight_column = 'y'
"let g:csv_no_conceal = 1

Plug 'DirDiff.vim'
"let g:DirDiffEnableMappings = 1
let g:DirDiffExcludes = 'CSV,.git,.svn'

Plug 'ciaranm/detectindent'
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
let g:detectindent_preferred_when_mixed = 1

Plug 'gregsexton/gitv'
Plug 'sjl/gundo.vim'
Plug 'keepcase.vim'
Plug 'matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'nobeans/unite-grails'
Plug 'tacroe/unite-mark'

Plug 'Shougo/unite.vim'
let g:unite_source_buffer_time_format = '%m/%d %H:%M'
let g:unite_source_history_yank_enable = 1
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '-H -i --nocolor --nogroup'
    let g:unite_source_grep_recursive_opt = ''
endif
if executable('wcfind')
    let g:unite_source_find_command = 'wcfind'
endif

Plug 'vcscommand.vim'

Plug 'vim-airline/vim-airline'
let g:airline_detect_iminsert = 1
let g:airline_inactive_collapse = 0
let g:airline_powerline_fonts = 1
let g:airline_section_x = 'b%n'
let g:airline_section_y = '%cx%04B'
let g:airline_section_z = '%l/%L %p%%'
let g:airline#extensions#branch#use_vcscommand = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'light'

" kalisi.vim
" light.vim *
" lucius.vim
" murmur.vim
" solarized.vim
" sol.vim *
" tomorrow.vim *
" understated.vim
" zenburn.vim

Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_filetypes_blacklist=['unite']

Plug 'tpope/vim-fugitive'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'Shougo/vimproc.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'kmnk/vim-unite-svn'
Plug '~/projects/vim-unite-vcs'
Plug 'guns/xterm-color-table.vim'

call plug#end()
" /vim-plug

if exists('g:unite_source_grep_command')
call unite#custom#profile('default', 'context', {
\    'ignorecase': 1,
\    'start_insert': 1,
\ })
call unite#custom_source('file,file_rec,file_rec/async,grep',
\    'ignore_pattern', join([
\       '\.git/',
\       '\.svn/',
\       'target/',
\       '.work/',
\    ], '\|'))
call unite#filters#matcher_default#use(['matcher_context'])
endif

"filetype plugin on
"syntax enable
"if &t_Co == 255
if $TERM =~ '256color'
    colorscheme justin
endif

if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
    set ttyfast
endif

"set runtimepath^=~/.vim/bundle/*

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'r'

let g:EasyGrepReplaceWindowMode = 2


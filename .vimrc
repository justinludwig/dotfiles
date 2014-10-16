set autoindent
set background=light
set backspace=indent,eol,start
set colorcolumn=80
set diffopt=filler,context:4,icase
set directory=~/tmp/vim//,~/tmp//,/var/tmp/vim//,/var/tmp//,/tmp//
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
set wildmenu
set wildmode=list:longest

syntax enable
colorscheme justin
filetype plugin on

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
noremap <leader>s :SubstituteCase/\v\c
noremap <leader>S :%SubstituteCase/\v\c
noremap <leader>pa "ap
noremap <leader>pb "ab
noremap <leader>pc "ac

noremap <leader>csv :set filetype=csv<CR>
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

cmap w!! w !sudo tee % > /dev/null

if filereadable('/usr/share/vim-scripts/macros/closetag.vim')
    " au FileType html,xml,gsp source /usr/share/vim-scripts/macros/closetag.vim
    let g:closetag_html_style=1
    source /usr/share/vim-scripts/macros/closetag.vim
endif

set runtimepath^=~/.vim/bundle/*

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

if &readonly
    set statusline=%f
    set statusline+=%=
    set statusline+=\ %c
    set statusline+=\ %l/%L
    set statusline+=\ %p%%
endif
let g:airline_detect_iminsert = 1
let g:airline_inactive_collapse = 0
let g:airline_powerline_fonts = 1
let g:airline_section_x = 'b%n'
let g:airline_section_y = '%cx%04B'
let g:airline_section_z = '%l/%L %p%%'
let g:airline_theme = 'base16'
" let g:airline#extensions#branch#use_vcscommand = 1

" kalisi.vim
" light.vim *
" lucius.vim
" murmur.vim
" solarized.vim
" sol.vim *
" tomorrow.vim *
" understated.vim
" zenburn.vim

let g:better_whitespace_filetypes_blacklist=['unite']

let g:csv_arrange_leftalign = 1
let g:csv_highlight_column = 'y'
let g:csv_no_conceal = 1

let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'r'

let g:EasyGrepReplaceWindowMode = 2

let g:unite_source_history_yank_enable = 1
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '-H -i --nocolor --nogroup'
    let g:unite_source_grep_recursive_opt = ''
endif
if executable('wcfind')
    let g:unite_source_find_command = 'wcfind'
endif

call unite#custom#profile('default', 'context', {
\    'start_insert': 1,
\ })
call unite#custom#profile('default', 'ignorecase', 1)
call unite#custom_source('file,file_rec,file_rec/async,grep',
\    'ignore_pattern', join([
\       '\.git/',
\       '\.svn/',
\       'target/',
\       '.work/',
\    ], '\|'))
call unite#filters#matcher_default#use(['matcher_context'])

if has('gui_running')
    let g:airline_theme='light'
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
    set ttyfast
endif


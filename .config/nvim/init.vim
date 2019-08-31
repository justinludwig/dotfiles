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
set infercase
set incsearch
set laststatus=2
set nobackup
set nojoinspaces
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

noremap <leader>fe :!eslint --fix %<CR>
noremap <leader>fs :!stylelint --fix %<CR>
noremap <leader>fp :!prettier --write %<CR>

noremap <leader>ss :syntax sync fromstart<CR>
noremap <leader>2 :set shiftwidth=2<CR>:set softtabstop=2<CR>
noremap <leader>csv :set filetype=csv<CR>
noremap <leader>txt :set filetype=text<CR>
noremap <leader>A :%ArrangeColumn
noremap <leader>u :MundoToggle<CR>
noremap <leader>w :StripWhitespace<CR>
noremap <leader>W :%StripWhitespace<CR>
noremap <leader>g :w !wc -m<CR>

noremap <leader>ll :ALEFix<CR>
noremap <leader>lp :ALEPrevious<CR>
noremap <leader>ln :ALENext<CR>
noremap <leader>lt :ALEToggle<CR>
noremap <leader>lb :ALEToggleBuffer<CR>
noremap <leader>ld :ALEDetail<CR>
noremap <leader>li :ALEInfo<CR>

noremap <space>/ :Ag 
" lines in current buffer
noremap <space>a :BLines 
noremap <space>b :Buffer<CR>
" tags in current buffer
noremap <space>c :BTags 
" dirty files
noremap <space>d :GFiles?<CR>
noremap <space>f :Files<CR>
" files in source control
noremap <space>g :GFiles<CR>
" command history
noremap <space>h :History:<CR>
noremap <space>j :Files<CR>.java 
noremap <space>s :Files<CR>.js 
noremap <space>l :Lines 
noremap <space>m :Marks<CR>
" previously opened files
noremap <space>o :History<CR>
noremap <space>t :Tags 
noremap <space>v :Files<CR>.vue 

nmap gs <Plug>Sneak_s
nmap gS <Plug>Sneak_S
xmap gs <Plug>Sneak_s
xmap gS <Plug>Sneak_S
omap gs <Plug>Sneak_s
omap gS <Plug>Sneak_S

cmap w!! w !sudo tee % >/dev/null

autocmd bufenter /dev/* set noswapfile
autocmd bufenter /run/* set noswapfile
autocmd bufenter /dev/* set noundofile
autocmd bufenter /run/* set noundofile

" sw=shiftwidth sts=softtabstop ts=tabstop
autocmd Filetype css setlocal sw=2 sts=2 ts=2
autocmd Filetype html setlocal sw=2 sts=2 ts=2
autocmd Filetype javascript setlocal sw=2 sts=2 ts=2
autocmd Filetype ruby setlocal sw=2 sts=2 ts=2
autocmd Filetype yaml setlocal sw=2 sts=2 ts=2

autocmd BufRead,BufNewFile */Jenkinsfile setfiletype groovy
" per-project settings
autocmd BufRead,BufNewFile ~/bw/* setlocal sw=2 sts=2 ts=2
autocmd BufRead,BufNewFile ~/bw/chainmonitor/* set tags=$HOME/.cache/tags/chainmonitor,$HOME/.cache/tags/openjdk10

" netrw tree view
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

if &readonly
    set statusline=%f
    set statusline+=%=
    set statusline+=\ %c
    set statusline+=\ %l/%L
    set statusline+=\ %p%%
endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug/
set nocompatible
call plug#begin('~/.config/nvim/plugged')

Plug 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 1000 " milliseconds
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
\   'css': ['prettier'],
\   'java': ['google_java_format'],
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'vue': ['prettier'],
\}

Plug 'vim-scripts/Align'
Plug 'bkad/CamelCaseMotion'

Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

"Plugin 'chrisbra/csv.vim'
"let g:csv_arrange_leftalign = 1
"let g:csv_highlight_column = 'y'
"let g:csv_no_conceal = 1

Plug 'vim-scripts/DirDiff.vim'
"let g:DirDiffEnableMappings = 1
let g:DirDiffExcludes = 'CSV,.git,.svn'

Plug 'ciaranm/detectindent'
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
let g:detectindent_preferred_when_mixed = 1

Plug 'junegunn/fzf', { 'dir': '~/source/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'gregsexton/gitv'
Plug 'modille/groovy.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-scripts/keepcase.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'

"Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_java_javac_config_file_enabled = 1

Plug 'vim-scripts/vcscommand.vim'

Plug 'vim-airline/vim-airline'
let g:airline_detect_iminsert = 1
let g:airline_inactive_collapse = 0
let g:airline_powerline_fonts = 1
let g:airline_section_x = 'b%n'
let g:airline_section_y = '%cx%04B'
let g:airline_section_z = '%l/%L %p%%'
let g:airline#extensions#ale#enabled = 1
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

Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'Shougo/vimproc.vim'
Plug 'mhinz/vim-signify'

Plug 'justinmk/vim-sneak'
let g:sneak#s_next = 1

Plug 'tpope/vim-surround'
Plug 'kmnk/vim-unite-svn'
Plug '~/projects/vim-unite-vcs'
Plug 'posva/vim-vue'
Plug 'guns/xterm-color-table.vim'

call plug#end()
" /vim-plug

filetype indent off
"filetype plugin on
"syntax enable
"if &t_Co == 255
if $TERM =~ '256color'
    colorscheme justin
endif

" thin cursor in insert mode with urxvt
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
    set ttyfast
endif

" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "justin"

hi Comment term=italic ctermfg=DarkGreen guifg=DarkGreen
hi Normal guifg=Black guibg=White ctermfg=Black ctermbg=White
hi Constant term=bold ctermfg=DarkCyan guifg=DarkCyan
hi Special term=bold ctermfg=DarkCyan guifg=DarkCyan
hi Identifier ctermfg=DarkBlue guifg=DarkBlue
hi Statement term=NONE ctermfg=Black gui=NONE guifg=Black
hi PreProc term=underline ctermfg=DarkMagenta guifg=DarkMagenta
hi Type term=NONE ctermfg=Blue gui=NONE guifg=Blue
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=Black guibg=Yellow
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=Cyan
hi Tag term=bold ctermfg=DarkBlue guifg=DarkBlue
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=White ctermfg=Blue guifg=Blue guibg=White
hi StatusLine term=reverse cterm=NONE ctermfg=DarkRed ctermbg=LightGray gui=NONE guifg=DarkRed guibg=LightCyan
hi SignColumn guifg=Black guibg=LightCyan ctermfg=DarkRed ctermbg=LightCyan
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label	Identifier	
hi link Operator	Statement
hi link Keyword	Identifier	
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special


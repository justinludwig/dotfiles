" set color column at 72
setlocal colorcolumn=+1

" set 'formatoptions' so that mutt can send format=flowed messages (:help fo-table)
    "t	Auto-wrap text using textwidth
    "c	Auto-wrap comments using textwidth, inserting the current comment leader automatically.
    "r	Automatically insert the current comment leader after hitting <Enter> in Insert mode.
    "o	Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
    "q	Allow formatting of comments with "gq".
    "w	Trailing white space indicates a paragraph continues in the next line.
    "a	Automatic formatting of paragraphs.
    "n	When formatting text, recognize numbered lists.
    "l	Long lines are not broken in insert mode.
    "j	Where it makes sense, remove a comment leader when joining lines.
setlocal fo=tcroqwnlj

" turn on spellchecking
setlocal spell

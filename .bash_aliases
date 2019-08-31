# jl

# force prompt to align to first column
PS1="\[\033[G\]$PS1"

test -e /usr/share/powerline && . /usr/share/powerline/bindings/bash/powerline.sh

test -e ~/bin && export PATH=$PATH:~/bin
test -e ~/.local/bin && export PATH=$PATH:~/.local/bin

# start ssh-agent if not already running
test "$SSH_AUTH_SOCK" || eval $(ssh-agent) >/dev/null
# setup just-in-time ssh-add if no identities yet available
ssh-add -l >/dev/null 2>&1 \
    || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
# start gpg-agent if not already running
pgrep gpg-agent >/dev/null || eval $(gpg-agent --daemon) >/dev/null

shopt -s cmdhist
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL='ignoreboth:erasedups'
HISTIGNORE='exit'
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

set -o vi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

shopt -s globstar 2>/dev/null
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

alias la='ls -latrh'
alias lsd='ls -ldh'
alias ltr='ls -ltrh'

alias gpg-list='gpg --list-only --no-default-keyring --secret-keyring /dev/null'

export EDITOR=/usr/bin/vi
export FIGNORE=.svn:.git

if [ -e /usr/bin/nvim ]; then
    alias vi='nvim'
    alias vimdiff='nvim -d'
    alias dvi='nvim -d'
    alias fvi='nvim $(fzf)'
    alias rvi='nvim -R'
    alias svi='sudo nvim'
    alias svndiff='svn diff | nvim -R -'
    export EDITOR=/usr/bin/nvim
fi
e() { urxvtcd -e nvim "$@" & true; }
r() { urxvtcd -e nvim -R --noplugin "$@" & true; }

#export PYTHONPATH="/home/justin/projects/powerline-svnstatus:$PYTHONPATH"

# add to .bashrc:
#test -f /usr/bin/ag && export FZF_DEFAULT_COMMAND='ag --ignore .git --hidden -g ""'
#test -f ~/.fzf.bash && source ~/.fzf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# jl

# force prompt to align to first column
PS1="\[\033[G\]$PS1"

test -e /usr/share/powerline && . /usr/share/powerline/bindings/bash/powerline.sh

test -e ~/bin && export PATH=$PATH:~/bin
test -e ~/.local/bin && export PATH=$PATH:~/.local/bin

# add 'AddKeysToAgent yes' to .ssh/config in place of ssh-agent hijinks

# start gpg-agent if not already running
pgrep gpg-agent >/dev/null || eval $(gpg-agent --daemon) >/dev/null

# add to .bashrc:
shopt -s cmdhist
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL='ignoreboth:erasedups'
HISTIGNORE='exit'
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

set -o vi
shopt -s globstar 2>/dev/null

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

export PYENV_ROOT=$HOME/source/pyenv
test -e $PYENV_ROOT/bin && export PATH=$PYENV_ROOT/bin:$PATH
command -v pyenv 1>/dev/null 2>&1 && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

#export PYTHONPATH="/home/justin/projects/powerline-svnstatus:$PYTHONPATH"

# add to .bashrc:
#test -f /usr/bin/ag && export FZF_DEFAULT_COMMAND='ag --ignore .git --hidden -g ""'
#test -f ~/.fzf.bash && source ~/.fzf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

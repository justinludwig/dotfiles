# jl

# force prompt to align to first column
PS1="\[\033[G\]$PS1"

function _update_ps1() {
    export PS1="$(~/bin/powerline-shell.py $? 2> /dev/null)"
}
test -e ~/bin/powerline-shell.py && test "$COLORTERM" = "gnome-terminal" \
    && export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

test -e ~/bin && export PATH=$PATH:~/bin

set -o vi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# workaround for 'unable to register window with path' error
alias gvim='gvim &>/dev/null'
alias gview='gview --noplugin &>/dev/null'
#gvim() { /usr/bin/gvim -f "$@" & true; }

alias la='ls -latrh'
alias lsd='ls -ldh'
alias ltr='ls -ltrh'

alias gpg-list='gpg --list-only --no-default-keyring --secret-keyring /dev/null'

export EDITOR=/usr/bin/vim
export FIGNORE=.svn:.git
export GREP_OPTIONS="--exclude-dir=\.{svn,git}"

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

export GRAILS_HOME=/opt/grails
test -e $GRAILS_HOME && export PATH=$PATH:$GRAILS_HOME/bin

export GRADLE_HOME=/opt/gradle
test -e $GRADLE_HOME && export PATH=$PATH:$GRADLE_HOME/bin

test -e /opt/phantomjs/bin && export PATH=$PATH:/opt/phantomjs/bin
test -e /opt/percona/bin && export PATH=$PATH:/opt/percona/bin

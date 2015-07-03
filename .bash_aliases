# jl

# force prompt to align to first column
PS1="\[\033[G\]$PS1"

function _update_ps1() {
    export PS1="$(~/bin/powerline-shell.py $? 2> /dev/null)"
}
test -e ~/bin/powerline-shell.py && test "$COLORTERM" != "" \
    && export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

test -e ~/bin && export PATH=$PATH:~/bin

# ssh-agent fu
if [ -e ~/bin/ssh-find-agent.sh ]; then
    . ~/bin/ssh-find-agent.sh
    ssh-find-agent -a
fi
# start ssh-agent if not already running
test "$SSH_AUTH_SOCK" || eval $(ssh-agent) >/dev/null
# setup just-in-time ssh-add if no identities yet available
ssh-add -l >/dev/null \
    || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
# start gpg-agent if not already running
test "$GPG_AGENT_INFO" || eval $(gpg-agent --daemon) >/dev/null

set -o vi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# workaround for 'unable to register window with path' error
alias gvim='gvim &>/dev/null'
alias gview='gview --noplugin &>/dev/null'
#gvim() { /usr/bin/gvim -f "$@" & true; }

e() { urxvtcd -e vi "$@" & true; }
r() { urxvtcd -e view --noplugin "$@" & true; }

alias la='ls -latrh'
alias lsd='ls -ldh'
alias ltr='ls -ltrh'

alias gpg-list='gpg --list-only --no-default-keyring --secret-keyring /dev/null'

export EDITOR=/usr/bin/vim
export FIGNORE=.svn:.git
export GREP_OPTIONS="--exclude-dir=\.{svn,git}"

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

test -e /opt/phantomjs/bin && export PATH=$PATH:/opt/phantomjs/bin
test -e /opt/percona/bin && export PATH=$PATH:/opt/percona/bin

[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"

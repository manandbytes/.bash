# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# http://www.oreillynet.com/onlamp/blog/2007/01/whats_in_your_bash_history.html
# allow duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=
HISTFILESIZE=1000000000
HISTSIZE=1000000

# Put all alias definitions into a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1="\e[2m[\D{%F %Z} \A] \u@\h \w\e[0m\n> "
PROMPT_COMMAND='RET=$?; echo; if [ $RET != 0 ] ; then echo -e "exit status: \e[1;31m$RET\e[0m"; fi;'

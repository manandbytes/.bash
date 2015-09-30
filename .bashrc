# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# http://www.oreillynet.com/onlamp/blog/2007/01/whats_in_your_bash_history.html
# allow duplicate lines in the history. See bash(1) for more options
HISTCONTROL=
HISTFILESIZE=1000000000
HISTSIZE=1000000

# append to the history file, don't overwrite it
shopt -s histappend

# Put all alias definitions into a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1='\[\e[2m\]╒═ \D{%F %T %Z}, \D{%a #%V} | \u@\h \[\e[0;1;32m\]\w\[\e[0m\]\n\[\e[2m\]╘> \[\e[0m\]'
PROMPT_COMMAND='RET=$?; echo; if [ $RET != 0 ] ; then echo -e "exit status: \e[1;31m$RET\e[0m"; fi;'

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CONFIG_HOME

export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""

# grep: use colors
GREP_OPTIONS="--color=auto"
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

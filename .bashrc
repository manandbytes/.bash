# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Put all alias definitions into a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1="\e[2m[\D{%F %Z} \A] \u@\h \w\e[0m\n> "
PROMPT_COMMAND='RET=$?; echo; if [ $RET != 0 ] ; then echo -e "exit status: \e[1;31m$RET\e[0m"; fi;'

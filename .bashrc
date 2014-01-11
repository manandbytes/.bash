# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Put all alias definitions into a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Put all alias definitions into a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# place caches on tmpfs
export XDG_CACHE_HOME="/dev/shm/${USER}/.cache"

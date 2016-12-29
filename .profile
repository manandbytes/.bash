# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# place caches on tmpfs
export XDG_CACHE_HOME="${TMP}/.cache"

_byobu_sourced=1 . /usr/bin/byobu-launch

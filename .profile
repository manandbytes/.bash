# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

TMPDIR="/dev/shm/${USER}/tmp"
if [ ! -d "${TMPDIR}" ]; then
    mkdir -p "${TMPDIR}"
fi
export TMPDIR

# place caches on tmpfs
export XDG_CACHE_HOME="/dev/shm/${USER}/.cache"

_byobu_sourced=1 . /usr/bin/byobu-launch

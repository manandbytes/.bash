TMPDIR="/dev/shm/${USER}/tmp"
if [ ! -d "${TMPDIR}" ]; then
    mkdir -p "${TMPDIR}"
fi
export TMPDIR

# place caches on tmpfs
export XDG_CACHE_HOME="/dev/shm/${USER}/.cache"

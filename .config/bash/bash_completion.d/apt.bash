_cached_apt_archives=()

_apt_archive_completions()
{
    # do not complete anything after first argument have been provided
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi

    if [ ${#_cached_apt_archives[@]} -eq 0 ]; then
        mapfile -t releases < <(apt-cache policy | awk '/release/ {match($0, /a=[^, ]+/); print substr($0, RSTART+2, RLENGTH-2)}' | sort --unique)
        _cached_apt_archives=("${releases[*]}")
    fi

    COMPREPLY=($(compgen -W "${_cached_apt_archives[*]}" "${COMP_WORDS[1]}"))
}

complete -F _apt_archive_completions apt-list-upgradable apt-list-installed

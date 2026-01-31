eval "$(zoxide init bash)"

function __zoxide_pushd() {
    local dir="$1" func="${FUNCNAME[0]}"

    if [ -z "$dir" ]; then
        printf '%s: usage: %s <dir>\n' "$func" "$func" >&2
        return 1
    fi

    # literal path first
    if [ -d "$dir" ]; then
        pushd -- "$dir" >/dev/null 2>&1 || { printf '%s: failed to pushd %q\n' "$func" "$dir" >&2; return 1; }
        return 0
    fi

    local -a zdir
    readarray -t zdir < <(zoxide query --list -- "$dir" 2>/dev/null || true)

    case ${#zdir[@]} in
        1)
            pushd -- "${zdir[0]}" >/dev/null 2>&1 || { printf '%s: failed to pushd %q\n' "$func" "${zdir[0]}" >&2; return 1; }
            ;;
        0)
            printf '%s: no directories match %q\n' "$func" "$dir" >&2
            return 1
            ;;
        *)
            printf '%s: multiple directories match %q:\n' "$func" "$dir" >&2
            printf '  %s\n' "${zdir[@]}" >&2
            return 1
            ;;
    esac
}

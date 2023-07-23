
# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
alias hx='eval $(history | sed "s/^ *[0-9]* *//g" | fzf --tac --tiebreak=index --height=10)'
export HSTR_CONFIG=hicolor       # get more colors
function hstrnotiocsti {
    # https://github.com/dvorka/hstr/issues/485#issuecomment-1516577488, '--' was missing
    { READLINE_LINE="$( { </dev/tty hstr -- ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti" "\C-j"'; fi
export HSTR_TIOCSTI=n

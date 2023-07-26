# grep defaults
# - use colors
function grep() {
    command grep --color=auto "$@" ;
}

function egrep() {
    grep --extended-regexp "$@" ;
}

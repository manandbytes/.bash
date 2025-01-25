# fail fast if not-apt based system
command -v apt &> /dev/null || return ;

function apt-list-installed() {
    command apt list --installed 2>/dev/null | grep --extended-regexp "\b${1:-unstable}\b" ;
}

function apt-list-upgradable() {
    command apt list --upgradable --target-release "${1:-unstable}" 2>/dev/null ;
}

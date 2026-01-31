# ╒═ 2026-01-02 22:43:31 EET, Fri #01 | mn@think ~
# $_

PS1='\[\e[2m\]╒═ \D{%F %T %Z}, \D{%a #%V} | \u@\h \[\e[0;1;32m\]\w\[\e[0m\]\n\[\e[2m\]$ \[\e[0m\]'
PROMPT_COMMAND='RET=$?; echo; if [ $RET != 0 ] ; then echo -e "exit status: \e[1;31m$RET\e[0m"; fi'

PS1='\[\e[2m\]╒═ \D{%F %T %Z}, \D{%a #%V} | \u@\h \[\e[0;1;32m\]\w\[\e[0m\]\n\[\e[2m\]$ \[\e[0m\]'
# check 'help history':
# -a    append history lines from this session to the history file
# -c    clear the history list by deleting all of the entries
# -r    read the history file and append the contents to the history list
# -n    read all history lines not already read from the history file and append them to the history list
# PROMPT_COMMAND='history -a; history -c; history -r'
PROMPT_COMMAND='RET=$?; history -a; history -n; echo; if [ $RET != 0 ] ; then echo -e "exit status: \e[1;31m$RET\e[0m"; fi;'

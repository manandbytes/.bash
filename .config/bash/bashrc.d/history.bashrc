# history clean up:
# - remove dups
# awk '!seen[$0]++' .bash_history > .bash_history.seen
# - check for diff, should be none
# diff --unified <(sort -u .bash_history) <(sort -u .bash_history.seen)

# do not allow duplicate lines in the history
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=1000000000
HISTSIZE=${HISTFILESIZE}

# append to the history file, don't overwrite it
shopt -s histappend

# do not execute command from history immediately
shopt -s histverify

shopt -s cmdhist

# append history from memory to history file
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

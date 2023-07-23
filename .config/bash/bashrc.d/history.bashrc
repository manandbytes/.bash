# do not allow duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignorespace:erasedups
HISTFILESIZE=1000000000
HISTSIZE=${HISTFILESIZE}

# append to the history file, don't overwrite it
shopt -s histappend

# do not execute command from history immediately
shopt -s histverify

shopt -s cmdhist

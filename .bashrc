# If not running interactively, don't do anything
[ -z "$PS1" ] && return

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CONFIG_HOME

# https://waxzce.medium.com/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff
# mkdir -p "${XDG_CONFIG_HOME}"/bash/bashrc.d
# chmod 700 "${XDG_CONFIG_HOME}"/bash/bashrc.d
if [ -d "${XDG_CONFIG_HOME}"/bash/bashrc.d ]; then
    for file in "${XDG_CONFIG_HOME}"/bash/bashrc.d/*.bashrc
    do
        if [ -r "$file" ]; then
            source "$file"
        fi
    done
fi

# http://www.oreillynet.com/onlamp/blog/2007/01/whats_in_your_bash_history.html
# allow duplicate lines in the history. See bash(1) for more options
HISTCONTROL=
HISTFILESIZE=1000000000
HISTSIZE=1000000

# append to the history file, don't overwrite it
shopt -s histappend

# Put all alias definitions into a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1='\[\e[2m\]╒═ \D{%F %T %Z}, \D{%a #%V} | \u@\h \[\e[0;1;32m\]\w\[\e[0m\]\n\[\e[2m\]$ \[\e[0m\]'
PROMPT_COMMAND='RET=$?; echo; if [ $RET != 0 ] ; then echo -e "exit status: \e[1;31m$RET\e[0m"; fi;'

# Guix, package manager
# https://wiki.archlinux.org/title/Guix
# ~/.config/guix/current paths end up first in path list
for profile in "$HOME/.guix-profile" "$HOME/.config/guix/current"
do
  if [ -f "$profile/etc/profile" ]
  then
    # Load the user profile's settings.
    GUIX_PROFILE="$profile" ; \
    source "$profile/etc/profile"
  else
    # At least define this one so that basic things just work
    # when the user installs their first package.
    export PATH="$profile/bin${PATH:+:$PATH}"
    export INFOPATH="$profile/share/info${INFOPATH:+:$INFOPATH}"
  fi
done

unset profile

export GUIX_LOCPATH="${HOME}/.guix-profile/lib/locale"

GUIX_PROFILE="${HOME}/.config/guix/current"
source "$GUIX_PROFILE/etc/bash_completion.d/guix"
source "$GUIX_PROFILE/etc/bash_completion.d/guix-daemon"

# https://www.gnu.org/software/guix/manual/en/guix.html#Defining-Packages
export GUIX_PACKAGE_PATH="${XDG_CONFIG_HOME}/guix/packages"

# https://www.gnu.org/software/guix/manual/en/guix.html#X_002e509-Certificates
# export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
# export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
export SSL_CERT_DIR="/etc/ssl/certs"
export SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"

if [ -n "$GUIX_ENVIRONMENT" ]
then
    export PS1="\u@\h \w [dev]\$ "
# else
#    source ~/.bash_profile
fi

export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""

# grep: use colors
GREP_OPTIONS="--color=auto"
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# load Liquid Prompt if installed
if [ -f /usr/share/liquidprompt/liquidprompt ]; then
    . /usr/share/liquidprompt/liquidprompt
fi


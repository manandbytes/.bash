# if not running interactively, don't do anything
[ "${-#*i}" != "$-" ] || return

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CONFIG_HOME

XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"
export XDG_STATE_HOME

# https://waxzce.medium.com/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff
# mkdir -p "${XDG_CONFIG_HOME}"/bash/bashrc.d
# chmod 700 "${XDG_CONFIG_HOME}"/bash/bashrc.d
if [ -d "${XDG_CONFIG_HOME}"/bash/bashrc.d ]; then
    for file in "${XDG_CONFIG_HOME}"/bash/bashrc.d/*.bashrc; do
        if [ -r "$file" ]; then
            [ -r "$file" ] && source "$file"
        fi
    done
fi

# local bash completions
if [ -d "${XDG_CONFIG_HOME}"/bash/bash_completion.d ]; then
    for file in "${XDG_CONFIG_HOME}"/bash/bash_completion.d/*.bash; do
        [ -r "$file" ] && source "$file"
    done
fi

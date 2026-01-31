# https://github.com/junegunn/fzf/#environment-variables
# FZF_DEFAULT_COMMAND is not used by shell integration due to the slight difference in requirements.
# - CTRL-T runs $FZF_CTRL_T_COMMAND to get a list of files and directories
# - ALT-C runs $FZF_ALT_C_COMMAND to get a list of directories
# - vim ~/**<tab> runs fzf_compgen_path() with the prefix (~/) as the first argument
# - cd foo**<tab> runs fzf_compgen_dir() with the prefix (foo) as the first argument

source "${XDG_STATE_HOME}"/nix/profile/share/fzf/key-bindings.bash
source "${XDG_STATE_HOME}"/nix/profile/share/fzf/completion.bash

FZF_DEFAULT_OPTS="--layout reverse"
FZF_DEFAULT_OPTS+=" --wrap"
export FZF_DEFAULT_OPTS

FZF_CTRL_R_OPTS=
FZF_CTRL_R_OPTS+="--wrap "       # enable line wrap for long lines
FZF_CTRL_R_OPTS+="--height ~80% "
FZF_CTRL_R_OPTS+="--exact "     # do not "quote" (with ') every word
export FZF_CTRL_R_OPTS

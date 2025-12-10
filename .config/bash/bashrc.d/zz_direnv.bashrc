# must be the last that modifies PROMPT_COMMAND
if command -v direnv &> /dev/null; then
    eval "$(direnv hook bash)"
fi

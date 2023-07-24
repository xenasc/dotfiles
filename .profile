if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.config/bash/bashrc" ]; then
	. "$HOME/.config/bash/bashrc"
    fi
fi

# Prevent execution if the shell isn't interactive
[[ $- != *i* ]] && return

source $HOME/.config/bash/environment
source $HOME/.config/bash/aliases
source $HOME/.config/bash/functions

# Enable menu-style selection for autocompletions
zstyle ':completion:*' menu select
# Load and initialize the zsh completion system, with cache file
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh.compdump-$ZSH_VERSION
# Include special directories in completions
zstyle ':completion:*' special-dirs true
# Enable case-insensitive and flexible matching for autocompletions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Use LS_COLORS to colorize tab completion entries
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Rehash completion data after installing new packages
zstyle ':completion:*' rehash true
# Use advanced process completion for the 'kill' command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;34'
# Enable caching of completion data to speed up subsequent completions
zstyle ':completion::complete:*' use-cache true

# Set vi mode
bindkey -v
# Enable incremental history search with Ctrl+R
bindkey '^R' history-incremental-search-backward

# Set the maximum number of events to be stored in the internal history list
HISTSIZE=10000
# Set the maximum number of events to be saved in the history file
SAVEHIST=20000
# Share history data between all sessions
setopt SHARE_HISTORY
# Append commands to the history file as they are issued
setopt APPEND_HISTORY
# Remove older duplicates in the history when a new command is entered
setopt HIST_EXPIRE_DUPS_FIRST
# Do not enter command lines into the history list if they are duplicates
setopt HIST_IGNORE_DUPS
# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_ALL_DUPS
# Exclude duplicates from history when using 'fc -l' and 'history'
setopt HIST_FIND_NO_DUPS
# Remove superfluous blanks from each command line being added to the history list
setopt HIST_REDUCE_BLANKS
# Spell check the command line and offer corrections
#setopt CORRECT
#setopt CORRECT_ALL

HISTFILE="$XDG_CACHE_HOME/zsh.history"

# Enable percentage sign to be used in the prompt
setopt PROMPT_PERCENT
# Enable prompt string to be evaluated before it's printed
setopt PROMPT_SUBST

PROMPT='%D %* %1 %b%F{#0b98de}%~ %f
%? %F{#fd9014}%(!.#.>) %f'
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{yellow} *%f'
zstyle ':vcs_info:*' unstagedstr '%F{red} *%f'
zstyle ':vcs_info:git:*' formats '[%F{green}%b%f%c%u]'
zstyle ':vcs_info:git:*' actionformats '[%F{cyan}%b (%a)%f%c%u]'

RPROMPT='$vcs_info_msg_0_'

# Prevent execution if the shell isn't interactive
[[ $- != *i* ]] && return

source $HOME/.config/bash/environment
source $HOME/.config/bash/aliases
source $HOME/.config/bash/functions

# menu-style
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh.compdump-$ZSH_VERSION
zstyle ':completion:*' special-dirs true
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Tab completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# add new installed packages into completions
zstyle ':completion:*' rehash true
# Use better completion for the kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;34'
# use completion cache
zstyle ':completion::complete:*' use-cache true

setopt PROMPT_PERCENT
setopt PROMPT_SUBST
# history config
HISTSIZE=10000
SAVEHIST=20000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# Correction when you misstype
#setopt CORRECT
#setopt CORRECT_ALL

HISTFILE="$XDG_CACHE_HOME/zsh.history"

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
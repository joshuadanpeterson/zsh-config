# Profile Zsh startup time
zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# Load welcome-banner
autoload -U add-zsh-hook
add-zsh-hook precmd show_welcome_banner_once

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting aliases colored-man-pages fzf macos colorize python you-should-use welcome-banner)

# Set default editor to Neovim
export VISUAL=nvim
export EDITOR="$VISUAL"


# Enable VIM mode
bindkey -v
set -o vi
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# zsh-vi-mode
source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# j & k history search
zvm_after_init_commands+=("bindkey -a 'k' up-line-or-search" "bindkey -a 'j' down-line-or-search")

# Install NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# Loading nvm eagerly adds several seconds to shell startup. config/lazyload.zsh
# defines an nvm() shim that sources nvm.sh on first use instead.

# Enable/Disable stack logging
export MallocStackLogging=0
unset MallocStackLogging
unset MallocStackLoggingNoCompact

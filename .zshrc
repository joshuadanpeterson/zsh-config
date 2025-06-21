# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.
# Set and source your Zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"
export COLORTERM=nord
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Core settings
source ~/.config/zsh-config/config/core.zsh

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Path settings
source ~/.config/zsh-config/config/paths.zsh

# Aliases
source ~/.config/zsh-config/config/aliases.zsh

# Zoxide configurations
source ~/.config/zsh-config/config/zoxide.zsh

# Source private environment variables
if [ -f ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi

# Asynchronous or deferred loading
source ~/.config/zsh-config/config/async.zsh

# Source lazy load configurations
source ~/.config/zsh-config/config/lazyload.zsh

# Source functions configurations
source ~/.config/zsh-config/config/functions.zsh

# nvm
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier

# Move you-should-use message position
export YSU_MESSAGE_POSITION="after"

# Disable console I/O
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Open Man Pages in Neovim
export MANPAGER='nvim +Man!'

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Source jumper
source <(jumper --shell zsh)

# Set fzf colortheme
# https://shorturl.at/msyU9
export FZF_DEFAULT_OPTS="
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 \
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf \
  --border=rounded --border-label='' --preview-window='border-rounded' --prompt='> ' \
  --marker='>' --pointer='◆' --separator='─' --scrollbar='│'
"

# Source iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -f "$HOME/fig-export/zsh-config/dotfile.zsh" ]] && builtin source "$HOME/fig-export/zsh-config/dotfile.zsh"

# Q post block. Keep at the bottom of this file.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Add forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh
source /usr/local/opt/forgit/share/forgit/forgit.plugin.zsh

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
eval "$(zoxide init zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
export PATH="/Users/joshpeterson/Dropbox/programming/obsidian/python:$PATH"
# Warp Context Loader
source ~/Dropbox/programming/scripting/warp-context-loader/scripts/warp_startup.sh

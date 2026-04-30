export GITSTATUS_LOG_LEVEL=DEBUG

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Q pre block. Keep at the top of this file.
# Set and source your Zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"
export COLORTERM=nord
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Avoid slow prompt startup from Powerlevel10k Google Cloud segments. These
# invoke `gcloud config ...` and `gcloud projects describe ...` while drawing.
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS:#gcloud})
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS:#google_app_cred})

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
  --color=bg:#1e1e1e,fg:#d4d4d4,gutter:#1e1e1e,bg+:#264f78,fg+:#ffffff \
  --color=hl:#569cd6,hl+:#9cdcfe,info:#c586c0,marker:#b5cea8 \
  --color=prompt:#dcdcaa,spinner:#c586c0,pointer:#ffcc66,header:#9cdcfe,border:#6a9955 \
  --border=rounded --border-label='' --preview-window='border-rounded' --prompt='> ' \
  --marker='>' --pointer='◆' --separator='─' --scrollbar='│'
"

# Source iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Add forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh
source /usr/local/opt/forgit/share/forgit/forgit.plugin.zsh

# =============================================================================
#
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
export PATH="/Users/joshpeterson/Dropbox/programming/obsidian/python:$PATH"
# Warp Context Loader
source ~/Dropbox/programming/scripting/warp-context-loader/scripts/warp_startup.sh

# Add Docker Desktop CLI tools to PATH
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# Task Master aliases added on 7/3/2025
alias tm='task-master'
alias taskmaster='task-master'
# Fix malloc stack logging error for Python/aider
unset MallocStackLogging
unset MallocStackLoggingNoCompact

# Set path for Luarocks and Busted
export PATH=$HOME/.luarocks/bin:$PATH

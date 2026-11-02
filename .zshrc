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
[[ ! -r /Users/Shared/p10k/.p10k.zsh ]] || source /Users/Shared/p10k/.p10k.zsh
# Avoid slow prompt startup from Powerlevel10k Google Cloud segments. These
# invoke `gcloud config ...` and `gcloud projects describe ...` while drawing.
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS:#gcloud})
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS:#google_app_cred})

# Core settings
typeset -g ZSH_CONFIG_DIR=/Users/Shared/zsh-config
# Share installed code, but keep generated state inside each account.
export ZSH=/Users/Shared/oh-my-zsh
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-${HOST}-${ZSH_VERSION}"
export ZSH_DISABLE_COMPFIX="true"
# Shared code is administrator-managed; do not update it during shell startup.
zstyle ':omz:update' mode disabled
# Homebrew completions are owned by Josh, not by recorder or root.
if [[ "$USER" == "recorder" ]]; then
    fpath=(${fpath:#/usr/local/share/zsh/site-functions})
fi
[[ ! -r "$ZSH_CONFIG_DIR/config/core.zsh" ]] || source "$ZSH_CONFIG_DIR/config/core.zsh"

# Oh My Zsh
[[ ! -r "$ZSH/oh-my-zsh.sh" ]] || source "$ZSH/oh-my-zsh.sh"

# Path settings
[[ ! -r "$ZSH_CONFIG_DIR/config/paths.zsh" ]] || source "$ZSH_CONFIG_DIR/config/paths.zsh"

# Aliases
[[ ! -r "$ZSH_CONFIG_DIR/config/aliases.zsh" ]] || source "$ZSH_CONFIG_DIR/config/aliases.zsh"

# Zoxide configurations
[[ ! -r "$ZSH_CONFIG_DIR/config/zoxide.zsh" ]] || source "$ZSH_CONFIG_DIR/config/zoxide.zsh"

# Load account-local private settings only when the file is readable.
if [[ -r "$HOME/.zshenv_private" ]]; then
    source "$HOME/.zshenv_private"
fi

# Asynchronous or deferred loading
[[ ! -r "$ZSH_CONFIG_DIR/config/async.zsh" ]] || source "$ZSH_CONFIG_DIR/config/async.zsh"

# Source lazy load configurations
[[ ! -r "$ZSH_CONFIG_DIR/config/lazyload.zsh" ]] || source "$ZSH_CONFIG_DIR/config/lazyload.zsh"

# Source functions configurations
[[ ! -r "$ZSH_CONFIG_DIR/config/functions.zsh" ]] || source "$ZSH_CONFIG_DIR/config/functions.zsh"

# nvm
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier

# Move you-should-use message position
export YSU_MESSAGE_POSITION="after"

# Disable console I/O
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Open Man Pages in Neovim
export MANPAGER='nvim +Man!'

# Source fzf
[ -r "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
# Set up fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --zsh)"
fi

# Source jumper
if command -v jumper >/dev/null 2>&1; then
    source <(jumper --shell zsh)
fi

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
if [[ -r "${HOMEBREW_PREFIX:-/usr/local}/share/forgit/forgit.plugin.zsh" ]]; then
    source "${HOMEBREW_PREFIX:-/usr/local}/share/forgit/forgit.plugin.zsh"
elif [[ -r /usr/local/opt/forgit/share/forgit/forgit.plugin.zsh ]]; then
    source /usr/local/opt/forgit/share/forgit/forgit.plugin.zsh
fi

# =============================================================================
#
[[ ! -r "$HOME/.atuin/bin/env" ]] || source "$HOME/.atuin/bin/env"

if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init zsh)"
fi

# Load optional Dropbox paths and startup scripts only when Dropbox exists.
if [[ -d "$HOME/Dropbox" ]]; then
    [[ ! -d "$HOME/Dropbox/programming/obsidian/python" ]] || export PATH="$HOME/Dropbox/programming/obsidian/python:$PATH"
    # Warp Context Loader
    [[ ! -r "$HOME/Dropbox/programming/scripting/warp-context-loader/scripts/warp_startup.sh" ]] || source "$HOME/Dropbox/programming/scripting/warp-context-loader/scripts/warp_startup.sh"
fi

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

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C -d "$ZSH_COMPDUMP"
# <<< grok installer <<<

# Hermes CLI completion bindings (must be after final compinit)
if typeset -f _hermes >/dev/null 2>&1; then
  compdef _hermes hermes hermes-tui
fi


# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

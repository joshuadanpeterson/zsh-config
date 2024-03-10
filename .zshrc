# Set and source your Zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"
export COLORTERM=nord
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Core settings
source ~/.config/dotfiles/config/core.zsh

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Path settings
source ~/.config/dotfiles/config/path.zsh

# Aliases
source ~/.config/dotfiles/config/aliases.zsh

# Zoxide configurations
source ~/.config/dotfiles/config/zoxide.zsh

# Source private environment variables
if [ -f ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi

# Asynchronous or deferred loading
source ~/.config/dotfiles/config/async.zsh

# Source lazy load configurations
source ~/.config/dotfiles/config/lazyload.zsh

#Pyenv PATH setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# nvm
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier

## Measure Zsh startup time using Python
ZSH_START_TIME=$(python -c 'import time; print(time.time())')
ZSH_STARTUP_TIME_SHOWN=false

function zsh_startup_time() {
    precmd() {  # precmd is executed before each prompt
        if ! $ZSH_STARTUP_TIME_SHOWN; then
            local end_time=$(python -c 'import time; print(time.time())')
            local startup_time=$(python -c "import time; print(${end_time} - ${ZSH_START_TIME})")
            echo "Startup time: ${startup_time} seconds"
            ZSH_STARTUP_TIME_SHOWN=true
        fi
    }
}

zsh_startup_time

# colorls
if [ -f "$(dirname $(gem which colorls))/tab_complete.sh" ]; then
  source "$(dirname $(gem which colorls))/tab_complete.sh"
else
  echo "colorls tab completion not found"
fi

# Move you-should-use message position
export YSU_MESSAGE_POSITION="after"

# Disable console I/O
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Open files in Neovim using `fzf` with preview window and toggle preview
function fzf_nvim() {
    local file
    file=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window=right:50% --bind '?:toggle-preview') && nvim "$file"
}

# Open files in Neovim using `fzf` with fd, preview window and toggle preview
function fzf_ls_nvim() {
    local file
    file=$(fd -H --type f --exclude .git . \
        | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' \
              --preview-window=right:50% --bind '?:toggle-preview') && [ -n "$file" ] && nvim "$file"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


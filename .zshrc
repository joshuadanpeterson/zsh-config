# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
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

# Source functions configurations
source ~/.config/dotfiles/config/functions.zsh

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

# Source iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

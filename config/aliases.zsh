# Aliases

# Change Directory to NucampFolder NodeJS
alias nc='cd "$HOME/Dropbox/programming/education/NucampFolder/WebDev/5-NodeJS-Express-MongoDB/" && ls'

# Change Directory to Home Directory
alias home='cd ~'

# .config/dotfiles
alias dot='cd "$HOME/.config/dotfiles"'

# zshrc
alias zshrc='nvim "$HOME/.config/dotfiles/.zshrc"'
alias sz='source "$HOME/.config/dotfiles/.zshrc"'
alias aliases='nvim "$HOME/.config/dotfiles/config/aliases.zsh"'

# Powerlevel10k
alias sp='source $HOME/.config/p10k/.p10k.zsh'

# Tmux
alias tmxc='nvim "$HOME/.config/tmux/.tmux.conf"'
alias tmxs='tmux source "$HOME/.config/tmux/.tmux.conf"'
alias tmxd='cd "$HOME/.config/tmux/"'
alias tmxas='tmux attach-session -t session-name'
alias tmxls='tmux list-sessions'
alias tmxlk='tmux list-keys'
alias tmx='tmux'
alias tmxn='tmux attach -t base || tmux new -s base'
alias tmxks='tmux kill-server'

# Lazy Load plugins
alias lzyld='nvim "$HOME/.config/dotfiles/lazyload.zsh"'
alias slzyld='source "$HOME/.config/dotfiles/lazyload.zsh"'

# ColorLS to LS
alias ls='colorls -ago'
alias ln='fzf_ls_nvim'
alias lf='fzf_nvim'
alias lc='ls | fzf | pbcopy'

# List aliases with fzf
alias af='alias | fzf'
# List aliases and copy result to clipboard
alias al="alias | fzf | cut -d'=' -f1 | awk '{print $2}' | pbcopy | pbpaste"

# Codewhisperer AI
alias ca='cw ai'

# Display Window #, Pane # , & Date in tmx Statusbar
alias tmxdp='tmux display-message "Window: #I Pane: #{pane_index} Date: $(date)"'

# nvim config
alias nvimc='nvim "$HOME/.config/nvim/init.lua"'
alias nvimd='cd "$HOME/.config/nvim"'

# Lazygit
alias lg='lazygit'

alias lnpm='lazynpm'

# Lazydocker
alias ld='lazydocker'

# ranger config
alias rnd='cd "$HOME/.config/ranger"'
alias rnc='nvim "$HOME/.config/ranger/rc.conf"'
alias rn='ranger'

# Leetcode
alias lc='nvim leetcode.nvim'

# Obsidian Vaults
alias obl='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Blogging/" && nvim'
alias ocr='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Crypto/" && nvim'
alias ojo='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Journals/" && nvim'
alias opo='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Poetry/" && nvim'
alias opr='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Programming/" && nvim'
alias otr='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Temporal Rift/" && nvim'
alias oud='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Udemy/" && nvim'

# Zoxide
alias z='zoxide'

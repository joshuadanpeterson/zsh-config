# Aliases

## <-- Dotfiles and configs -->
# .config/zsh-config
alias dot='cd "$HOME/.config/zsh-config"'

# zshrc
alias zshrc='nvim "$HOME/.config/zsh-config/.zshrc"'
alias sz='source "$HOME/.config/zsh-config/.zshrc"'
alias aliases='nvim "$HOME/.config/zsh-config/config/aliases.zsh"'

# Lazy Load plugins
alias lzyld='nvim "$HOME/.config/zsh-config/lazyload.zsh"'
alias slzyld='source "$HOME/.config/zsh-config/lazyload.zsh"'

# Powerlevel10k
alias sp='source $HOME/.config/p10k/.p10k.zsh'

# nvim config
alias nvimc='nvim "$HOME/.config/nvim/init.lua"'
alias nvimd='cd "$HOME/.config/nvim"'

## <-- Change Directories -->
# eza and ColorLS to LS
alias ls='eza --color=always -l --git --git-repos  --icons=always  --no-permissions --no-user -a -a --header | lolcat'
alias lz='fzf_ls_nvim'
alias lf='fzf_nvim'
alias lp='fd --hidden | fzf --color=16 | pbcopy'

# Change Directory to Home Directory
alias home='cd ~'

# Change Directory to LeetCode directory
alias lcd='cd "$HOME/Dropbox/programming/leetcode/" && ls'

# Change Directory to NucampFolder NodeJS
alias nc='cd "$HOME/Dropbox/programming/education/NucampFolder/WebDev/5-NodeJS-Express-MongoDB/" && ls'

# Obsidian Vaults
alias obl='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Blogging/" && nvim'
alias ocr='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Crypto/" && nvim'
alias ojo='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Journals/" && nvim'
alias opo='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Poetry/" && nvim'
alias opr='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Programming/" && nvim'
alias otr='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Temporal Rift/" && nvim'
alias oud='cd "$HOME/Dropbox/DropsyncFiles/Obsidian Vault/Udemy/" && nvim'

# ranger config
alias rnd='cd "$HOME/.config/ranger"'
alias rnc='nvim "$HOME/.config/ranger/rc.conf"'
alias rn='ranger'

# Zoxide
alias zo='zoxide'

## <-- Tmux commands -->
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

# Display Window #, Pane # , & Date in tmx Statusbar
alias tmxdp='tmux display-message "Window: #I Pane: #{pane_index} Date: $(date)"'

## <-- Alias -->
# List aliases with fzf
alias af='alias | fzf --color=16'
# List aliases and copy result to clipboard
alias al="alias | fzf --color=16 | cut -d'=' -f1 | awk '{print $2}' | pbcopy | pbpaste"

# Count alias usage
alias cu='count_alias_usage | fzf --reverse'

# Use bat with GitHub theme
alias bat='bat --theme=GitHub --color=always'

## <-- TLDR -->
# Set fzf_tldr
alias tf='fzf_tldr'

# List tldr pages
alias tl='tldr -l | fzf --color=16 | pbcopy'

# List man pages
alias ml='fzf_man | pbcopy'

# Search command history
alias hist='fzfhist' # with fzf and execute
alias hg='history | grep '
## <-- Git commands -->
# Set git blame config
alias gb='git blame -n --show-stats --color-lines'
alias glgc='git log -1 --pretty=%B | lolcat' # Get last git commit message
alias gac='gaa && gc -m' # beginning of git add and git commit
alias gpom='gp -u origin main'
alias gai='gaa & aicommits -t conventional'
alias acc='aicommits -t conventional'
alias cctypes='npx conventional-commit-types-cli' # Conventional Commits Glossary
alias gflog='fzf_glog' # Git Log with fzf

# Package Installs
alias gast='npm i -S @types/google-apps-script' # Adds Google Apps Script Autocomplete to local projects

## <-- Tools -->
# Add pwd to clipboard
alias pwd='pwd | tee >(pbcopy)'

# Codewhisperer AI
alias ca='cw ai'

# Lazygit
alias lg='lazygit'

# Lazynpm
alias lnpm='lazynpm'

# Lazydocker
alias ld='lazydocker'

# html2text
alias hm='html2text'

## <-- LeetCode -->
# LeetCode
alias lc='nvim leetcode.nvim'

# Aliasing Python
alias python='python3'

# <-- Development Directories -->
alias glossd='cd ~/Dropbox/programming/cli-apps/my-apps/gloss/'
alias glossc='nvim ~/Dropbox/programming/cli-apps/my-apps/gloss/'

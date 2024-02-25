# Aliases

# Change Directory to NucampFolder NodeJS
alias nc='cd /Users/joshpeterson/Dropbox/programming/education/NucampFolder/WebDev/5-NodeJS-Express-MongoDB/ && ls'

# .config/dotfiles
alias dot='cd ~/.config/dotfiles'

# zshrc
alias zshrc='nvim ~/.config/dotfiles/.zshrc'
alias szshrc='source ~/.config/dotfiles/.zshrc'

# Tmux 
alias tmxc='nvim ~/.config/tmux/.tmux.conf'
alias tmxs='tmux source ~/.config/tmux/.tmux.conf'
alias tmxd='cd ~/.config/tmux/'
alias tmxas='tmux attach-session -t session-name'
alias tmxls='tmux list-sessions'
alias tmxlk='tmux list-keys'
alias tmx='tmux'
alias tmxn='tmux attach -t base || tmux new -s base'

# Lazy Load plugins
alias lzyld='nvim ~/.config/dotfiles/lazyload.zsh'
alias slzyld='source ~/.config/dotfiles/lazyload.zsh'

# ColorLS to LS
alias ls='colorls'

# Display Window #, Pane # , & Date in tmx Statusbar
alias tmxdp='tmux display-message "Window: #I Pane: #{pane_index} Date: $(date)"'

# nvim config
alias nvimc='nvim ~/.config/nvim/init.lua'
alias nvimd='cd ~/.config/nvim'

# ranger config
alias rnd='cd ~/.config/ranger'
alias rnc='nvim ~/.config/ranger/rc.conf'
alias rn='ranger'

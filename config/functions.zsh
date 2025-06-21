# Functions
#

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

# Open files in Neovim using `fzf` with preview window and toggle preview
function fzf_nvim() {
    local file
    file=$(fzf --color=16 \
        --preview 'bat --theme=GitHub --style=numbers --color=always --line-range :500 {}' \
        --preview-window=right:50% --bind '?:toggle-preview') && nvim "$file"
}

# Open files in Neovim using `fzf` with colorls, preview window and toggle preview
function fzf_ls_nvim() {
    local file
    file=$(lsd -a -R | grep -v '.git' \
        | fzf --color=16 \
              --preview 'bat --theme=GitHub --color=always --line-range :500 {} || echo {}' \
              --preview-window=down:3:wrap --bind='?:toggle-preview' \
        | awk '{print $NF}' ) && [ -n "$file" ] && nvim "$file"
}

# Zoxide with icons reveal all
function zi() {
    cd "$(zoxide query -i $@)" && colorls -ago
}

# colorls
if [ -f "$(dirname $(gem which colorls))/tab_complete.sh" ]; then
  source "$(dirname $(gem which colorls))/tab_complete.sh"
else
  echo "colorls tab completion not found"
fi

# Keep prompt at bottom of iTerm2 terminal after clearing
function cl {
  clear && tput cup 9999 0
}

# Count usage history of aliases
function count_alias_usage() {
  echo -e "Alias\tCount"
  alias | cut -d'=' -f1 | cut -d' ' -f2 | while read alias_command; do
      if ! [[ $alias_command =~ ^[0-9]+$ || $alias_command =~ ^[/.]+$ || $alias_command == "-" ]] ; then
          count=$(history | grep -w "$alias_command" | wc -l);
          if [ $count -ne 0 ]; then echo -e "$alias_command\t$count"; fi;
      fi;
  done | sort -t$'\t' -k2 -nr | column -t
}

# --- Select tldr page with fzf and display --- #

# Get the selected command from fzf
fzf_tldr() {
    # Get the selected command from fzf
    local selected_command=$(tldr -a --color=always | fzf --ansi --color=16 --preview 'tldr {} --color=always | bat --style=plain,header --color=always')

    # Check if a command was selected
    if [ -n "$selected_command" ]; then
        # Show the tldr page for the selected command
        tldr $selected_command --color=always | tee >(pbcopy)
    else
        echo "No command selected."
    fi
}

# --- Select man page from fzf and display --- #

# Search for man pages and display in fzf preview window
fzf_man() {
    local selected_command=$(man -k . | fzf --color=16 | awk -F '(' '{print $1}' | tr -d '[:space:]')
    echo "man $selected_command"
    echo $selected_command | pbcopy
}

# Search command history with fzf and execute
fzfhist() {
  eval $(history | fzf | awk '{$1=""; print $0}')
}

# Search git commit log with fzf
fzf_glog () {
    git log \
        --color=always \
        --format="%C(cyan)%h %C(blue)%ar%C(auto)%d %C(yellow)%s%+b %C(black)%ae" "$@" |
        fzf -i -e +s \
            --tiebreak=index \
            --no-multi \
            --ansi \
            --preview="echo {} |
                        grep -o '[a-f0-9]\{7\}' |
                        head -1 |
                        xargs -I % sh -c 'git show --color=always % | delta'" \
            --header "enter: view, C-c: copy hash" \
            --bind "enter:execute:_viewGitLogline | less -R" \
            --bind "ctrl-c:execute:_gitLoglLineToHash | pbcopy"
}

# Helper function to extract the commit hash from the selected line
_viewGitLogLine() {
    # Extract the commit hash from the input line
    local commit_hash=$(echo "$1" | grep -o '[a-f0-9]\{7,40\}')

    # Use git show to display the commit details
    if [ ! -z "$commit_hash" ]; then
        echo "Commit hash: $commit_hash"
        git show --color=always "$commit_hash" | less -R
    else
        echo "No commit hash found."
    fi
}

# Helper function to copy the commit hash from the selected line to the clipboard
_gitLogLineToHash() {
    # Extract the commit hash from the input line
    local commit_hash=$(echo "$1" | grep -o '[a-f0-9]\{7,40\}')

    # Copy the commit hash to the clipboard
    # Uncomment the line that corresponds to your operating system

    # macOS
    echo "$commit_hash" | pbcopy

    # Linux
    # echo $commit_hash | xclip -selection clipboard

    # Windows (Git Bash)
    # echo $commit_hash | clip.exe

    # For demonstration, just echo the hash
    # echo "Commit hash: $commit_hash"
}

# ================================================================================
# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

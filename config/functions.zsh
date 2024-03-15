# Functions

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
    file=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window=right:50% --bind '?:toggle-preview') && nvim "$file"
}

# Open files in Neovim using `fzf` with colorls, preview window and toggle preview
function fzf_ls_nvim() {
    local file
    file=$(lsd -a -R | grep -v '.git' \
        | fzf --preview 'bat --color=always --line-range :500 {} || echo {}' \
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

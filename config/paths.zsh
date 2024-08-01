# Ensure core utilities are available
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"


# Add the requested paths
# export PATH="/Users/joshpeterson/.nvm/versions/node/v22.2.0/bin:$PATH"
# export PATH="/opt/local/bin:$PATH"
# export PATH="/opt/local/sbin:$PATH"
# export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
export PATH="/usr/local/bin:$PATH" # Add the npm global bin directory
# export PATH="/System/Cryptexes/App/usr/bin:$PATH"
# export PATH="/usr/bin:$PATH"
# export PATH="/bin:$PATH"
# export PATH="/usr/sbin:$PATH"
# export PATH="/sbin:$PATH"
# export PATH="/usr/local/Cellar/tesseract/5.3.2_1/bin/:$PATH"
# export PATH="/usr/local/Cellar/tesseract-lang/4.1.0/share/tessdata/:$PATH"
# export PATH="/usr/local/Cellar/imagemagick/7.1.1-15_1/bin/:$PATH"
# export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:$PATH"
# export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:$PATH"
# export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:$PATH"
# export PATH="/opt/X11/bin:$PATH"
# export PATH="/Library/Apple/usr/bin:$PATH"
# export PATH="/usr/local/MacGPG2/bin:$PATH"
# export PATH="/Library/TeX/texbin:$PATH"
# export PATH="/Applications/Wireshark.app/Contents/MacOS:$PATH"
# export PATH="/usr/local/go/bin:$PATH"
# export PATH="/Users/joshpeterson/.cargo/bin:$PATH"
# export PATH="/Users/joshpeterson/.local/bin:$PATH"
# export PATH="/usr/local/opt/fzf/bin:$PATH"

# Remove duplicate and invalid PATH entries
# export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v 'Unknown command' | grep -v '^bin$' | awk -v RS=: -v ORS=: '!a[$1]++' | sed 's/:$//')

# Add aws4 to path
export PATH="/usr/local/lib/node_modules/aws4/bin:$PATH"

# Google Cloud Environment Variable & SDK
export CLOUDSDK_PYTHON=/Users/joshpeterson/.pyenv/shims/python
export PATH="$PATH:$HOME/google-cloud-sdk/bin"

# MongoDB
export PATH="/usr/local/opt/mongodb-community-shell@4.4/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@4.4/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joshpeterson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joshpeterson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joshpeterson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joshpeterson/google-cloud-sdk/completion.zsh.inc'; fi

# fzf
export FZF_BASE=/path/to/fzf/install/dir

# hub
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
   FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Tesseract Path
export PATH="/usr/local/Cellar/tesseract/5.3.2_1/bin:$PATH"

# Tesseract-Lang Path
export PATH="/usr/local/Cellar/tesseract-lang/4.1.0/share/tessdata/:$PATH"

# ImageMagick Path
export PATH="/usr/local/Cellar/imagemagick/7.1.1-15_1/bin/:$PATH"

# Android Debug Bridge (ADB)
export PATH=$PATH:~/Library/Android/sdk/platform-tools/

# Update Ruby path
export PATH="/usr/local/opt/ruby/bin:$PATH"
unset GEM_PATH

# Update language paths
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/bin"

# Update Alacritty path
export PATH="/Applications/Alacritty.app/Contents/MacOS:$PATH"

# Integrate .zprofile
if [ -f ~/.zprofile ]; then
   source ~/.zprofile
fi

# NPM & Node Modules Path
export PATH="$PATH:/System/Volumes/Data/Users/joshpeterson/.nvm/versions/node/v18.12.1/bin"
export PATH="$PATH:/usr/local/Cellar/node/21.6.2_1/bin"
export PATH="$PATH:/usr/local/Cellar/node/22.1.0/bin"
export PATH="/usr/local/Cellar/node/22.2.0/lib:$PATH"
export PATH="$PATH:/usr/local/Cellar/node/22.2.0/bin"

# Pyenv PATH setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Add path for sqlfluff
export PATH="$HOME/.local/bin:$PATH"

# Add path for Ruby/Gem
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.gem/bin:$PATH"

# Add go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

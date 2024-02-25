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

# Integrate .zprofile
if [ -f ~/.zprofile ]; then
  source ~/.zprofile
fi

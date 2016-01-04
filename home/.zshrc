#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
bindkey '^R' history-incremental-search-backward

source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
export PATH="$PATH:$HOME/.dynamic-colors/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
source '/home/alxarch/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/alxarch/google-cloud-sdk/completion.zsh.inc'

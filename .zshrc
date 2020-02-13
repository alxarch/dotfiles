#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi
#



source <(antibody init)
# antibody bundle zsh-users/zsh-completions
antibody bundle sorin-ionescu/prezto folder:modules/git # git shell tools
antibody bundle zsh-users/zsh-syntax-highlighting # syntax highlight
antibody bundle akz92/clean # clean theme
# antibody bundle danihodovic/steeef

autoload -U compinit && compinit

# Edit commandline in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# FZF
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh


# NVM
#
# define a function to init nvm
nvminit () {
	if [ -z "$NVM_DIR" ]; then
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	fi
}

alias scl='sudo systemctl'

# Google Cloud SDK
#
# define a function to init google-cloud-sdk tools
gclinit () {
	if [ -z "$GCL_DIR" ]; then
		export GCL_DIR="$HOME/google-cloud-sdk"
		# The next line updates PATH for the Google Cloud SDK.
		source "$GCL_DIR/path.zsh.inc"
		# The next line enables shell command completion for gcloud.
		source "$GCL_DIR/completion.zsh.inc"
	fi
	# Kubernetes
	source <(kubectl completion zsh) # Enable command completion for kubernetes.
	# Kubernetes aliases
	alias kcl='kubectl'
	alias kCf='kubectl create -f'
	alias kAf='kubectl apply -f'
	alias kDf='kubectl delete -f'
	alias kgp='kubectl get pod -o wide'
	alias kgs='kubectl get service'
	alias kgd='kubectl get deployment'
	alias kgc='kubectl get config'
	alias kgr='kubectl get rc'
}

# Gitignore alias
function gign() { curl -L -s "https://www.gitignore.io/api/$@" ;}

# HISTORY
export HISTFILE=~/.zhistory
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP  

setopt PROMPT_SUBST

source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Enable dynamic colors
source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
export PATH="$PATH:$HOME/.dynamic-colors/bin"
alias dcl='dynamic-colors switch solarized-light-desaturated'
alias dcd='dynamic-colors switch solarized-dark'

# Avoid mistakes with glob patterns
alias rm='rm -I'
alias dotfiles='git --git-dir=$HOME/.dotfilesrepo --work-tree=$HOME'


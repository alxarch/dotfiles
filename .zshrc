#
# Executes commands at the start of an interactive session.
#

source <(antibody init)
antibody bundle ohmyzsh/ohmyzsh path:plugins/gitfast # git shell tools
antibody bundle akz92/clean # clean theme
antibody bundle zsh-users/zsh-completions # completions
antibody bundle zsh-users/zsh-syntax-highlighting # syntax highlight

autoload -Uz compinit
autoload -Uz bashcompinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
	bashcompinit;
else
	compinit -C;
fi

# Edit commandline in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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

# source $HOME/.homesick/repos/homeshick/homeshick.sh
# fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Enable dynamic colors
# source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
# export PATH="$PATH:$HOME/.dynamic-colors/bin"
# alias dcl='dynamic-colors switch solarized-light-desaturated'
# alias dcd='dynamic-colors switch solarized-dark'

# Avoid mistakes with glob patterns
alias rm='rm -I'

# Handle dotfiles
alias dotfiles='GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" git'
alias scl='sudo systemctl'

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

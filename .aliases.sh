#
# Aliases
#


# Colorize ls output
alias ls='ls --color=auto'

alias la='ls -la'
alias ll='ls -1'

# Humanize du output
alias du='du -h'

# Avoid mistakes with glob patterns
alias rm='rm -I'

# Handle dotfiles
alias dotfiles='GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" git'

alias sys='sudo systemctl'
alias kub='kubectl'

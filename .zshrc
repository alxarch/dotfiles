#
# Executes commands at the start of an interactive session.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'

#
# Less
#

export PAGER='less'

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# -r color
export LESS='-F -r -g -i -M -R -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Edit commandline in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Automatically handle urls
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

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
# FZF
if [ -d /usr/share/fzf ]; then
	. /usr/share/fzf/key-bindings.zsh
	. /usr/share/fzf/completion.zsh
fi

if [ -x "$(which antibody)" ]; then
	source <(antibody init)
	antibody bundle ohmyzsh/ohmyzsh path:plugins/gitfast # git shell tools
	antibody bundle akz92/clean # clean theme
	antibody bundle zsh-users/zsh-completions # completions
	antibody bundle zsh-users/zsh-syntax-highlighting # syntax highlight
	if [ -x "$(which nix-env)" ]; then
		antibody bundle spwhitt/nix-zsh-completions.git
	fi
fi

autoload -Uz compinit
autoload -Uz bashcompinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
	bashcompinit;
else
	compinit -C;
fi

. "$HOME/.aliases.sh"

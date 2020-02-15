#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Paths
#

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

. "$HOME/.profile"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

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
export VISUAL='codium --wait'

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

#
# Google Cloud SDK
#
if [ -z "$GOOGLE_CLOUD_SDK_ROOT" ]; then
	GOOGLE_CLOUD_SDK_ROOT="$HOME/.local/opt/google-cloud-sdk"
fi
if [ -d "$GOOGLE_CLOUD_SDK_ROOT" ]; then
	export GOOGLE_CLOUD_SDK_ROOT
	# The next line updates PATH for the Google Cloud SDK.
	source "$GOOGLE_CLOUD_SDK_ROOT/path.zsh.inc"
	# The next line enables shell command completion for gcloud.
	source "$GOOGLE_CLOUD_SDK_ROOT/completion.zsh.inc"
fi

# Kubernetes
if [ -x "$(which kubectl)" ]; then
	source <(kubectl completion zsh) # Enable command completion for kubernetes.
fi


#
# direnv
#
if [ -x "$(which direnv)" ]; then
	eval "$(direnv hook zsh)"
fi

# nvm
if [ -z "$NVM_DIR" ]; then
	NVM_DIR="$HOME/.local/opt/nvm"
fi

if [ -d "$NVM_DIR" ]; then
	export NVM_DIR
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# FZF
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

# Gitignore alias
function gign() { curl -L -s "https://www.gitignore.io/api/$@" ;}


# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )



#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

[[ -z "$DISPLAY" &&  "$XDG_VTNR" -eq "1" ]] && session=i3 startx
[[ -z "$DISPLAY" &&  "$XDG_VTNR" -eq "2" ]] && session=kde startx

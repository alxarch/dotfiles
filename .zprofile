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
	if [[ -o interactive ]]; then
		source "$GOOGLE_CLOUD_SDK_ROOT/completion.zsh.inc"
	fi
fi

if [[ -o interactive ]]; then
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
fi

# nvm
if [ -z "$NVM_DIR" ]; then
	NVM_DIR="$HOME/.local/opt/nvm"
fi

if [ -d "$NVM_DIR" ]; then
	export NVM_DIR
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	if [[ -o interactive ]]; then
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	fi
fi

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

case "$DISPLAY$TMUX$XDG_VTNR" in
	"1" ) XSESSION=i3 startx;;
	"2" ) XSESSION=kde startx;;
esac

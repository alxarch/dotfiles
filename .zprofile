#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
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

if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# Go

export GOPATH="$HOME/go"
if [ -d "$GOPATH/bin" ]; then
	export PATH="$GOPATH/bin:$PATH"
fi

# Ruby

if [ -x "$(which gem)" ]; then
	export PATH="$(ruby -r rubygems -e 'print Gem.path.map{|p| "#{p}/bin"}.join ":"'):$PATH"
fi

# Rust

if [ -d "$HOME/.cargo/bin" ]; then
	export PATH="$HOME/.cargo/bin:$PATH"
fi

#
# Nix
#

if [ -d "$HOME/.nix-profile" ]; then
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# direnv
if [ -x direnv ]; then
	eval "$(direnv hook zsh)"
fi


#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)


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

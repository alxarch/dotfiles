# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
    fi
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

#
# Nix
#

if [ -d "$HOME/.nix-profile" ]; then
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Go

if [ -d "$HOME/go/src" ]; then
	export GOPATH="$HOME/go"
	if [ -d "$GOPATH/bin" ]; then
		export PATH="$GOPATH/bin:$PATH"
	fi
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
# Editors
#

export EDITOR='vim'

#
# Less
#

export PAGER='less'


#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi


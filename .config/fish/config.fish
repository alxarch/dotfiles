# fortune
if functions -q fzf_key_bindings
	fzf_key_bindings
end
set fish_greeting

if status --is-interactive
	abbr --add --global dotfiles 'env GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" git'
	abbr --add --global rm 'rm -i'
end

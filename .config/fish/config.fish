# fortune
function fish_user_key_bindings --description "Vi + FzF + custom"
	fish_vi_key_bindings
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end
set fish_greeting
if status --is-interactive
	set -g fish_key_bindings fish_user_key_bindings
	abbr --add --global dotfiles 'env GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" git'
	abbr --add --global rm 'rm -i'
end

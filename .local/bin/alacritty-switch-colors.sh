config="$HOME/.config/alacritty/alacritty.yml"
grep -qF "colors: *light" $config && \
	( sed -i '/colors: \*light/ s/light/dark/' $config && echo "dark" ) || \
	( sed -i '/colors: \*dark/ s/dark/light/' $config && echo "light" )


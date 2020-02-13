#!/bin/sh
case "$1" in
	'laptop^hdmi')
		xrandr \
			--output eDP1 --auto \
			--output DP1 --off \
			--output HDMI2 --auto --above eDP1
			;;
	'laptop^hdmi>dp')
		xrandr \
			--output eDP1 --auto \
			--output HDMI2 --auto --above eDP1 \
			--output DP1 --auto --right-of HDMI2
			;;
	'laptop^dp>hdmi')
		xrandr \
			--output eDP1 --auto \
			--output DP1 --auto --above eDP1 \
			--output HDMI2 --auto --right-of DP1
			;;
	'laptop^dp')
		xrandr \
			--output eDP1 --auto --primary \
			--output DP1 --auto --above eDP1 \
			--output HDMI2 --off
			;;
	'hdmi')
		xrandr \
			--output eDP1 --off \
			--output DP1 --off \
			--output HDMI2 --auto --primary
			;;
	'dp')
		xrandr \
			--output eDP1 --off \
			--output DP1 --auto --primary \
			--output HDMI2 --off
			;;
	*)
		xrandr \
			--output eDP1 --auto \
			--output DP1 --off \
			--output HDMI2 --off
			;;
esac


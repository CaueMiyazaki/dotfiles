#!/bin/bash

# If its being called from waybar it will have a top-right anchor
# if no argument was passed, then CHOICE is set to zero
# This :- is bashs "Default value" operator
CHOICE=${1:-0}

# Options
lock=" Lock"
suspend="󰤄 Suspend"
logout="󰍃 Log out"
reboot=" Reboot"
shutdown=" Shutdown"

runFuzzel() {
	if [ "$CHOICE" == 1 ]; then
		echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown\n" | fuzzel --dmenu -l 5 --anchor top-right --x-margin 7 --y-margin 7 --hide-prompt
	else
		echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown\n" | fuzzel --dmenu -l 5 --hide-prompt
	fi
}

chosen="$(runFuzzel)"
case ${chosen} in
	$lock)
		loginctl lock-session
	;;
	$suspend)
		systemctl suspend
	;;
	$logout)
		loginctl terminate-user $USER
	;;
	$reboot)
		systemctl reboot
	;;
	$shutdown)
		systemctl poweroff
	;;
esac

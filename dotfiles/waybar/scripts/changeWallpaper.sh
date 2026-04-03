#!/bin/bash

##-------------------------------------------------------
# some transition types: 
#  simple (fade into image)
#  outer  (shrinks into image)
#  grow   (grows into image)
#  wipe
#  random
##-------------------------------------------------------

transition_type="grow"
refreshRate="72"
wallpaperDir="$(xdg-user-dir PICTURES)/Wallpapers"
selectedImage="$(find "$wallpaperDir" -name '*.png' | shuf -n1)"

if pgrep "awww-daemon" > /dev/null ; then
	if [[ "$transition_type" == "grow" ]]; then
		awww img "$selectedImage" --transition-fps $refreshRate --transition-type $transition_type --transition-duration 1 --transition-pos 1725,20 --invert-y
	else
		awww img "$selectedImage" --transition-fps $refreshRate --transition-type $transition_type --transition-duration 1
	fi
else
  notify-send "Error" "Wallpaper daemon not running!"
fi

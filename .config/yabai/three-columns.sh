# ~/.config/yabai/three-columns.sh  (Remember to chmod +x the file)
windows=$(yabai -m query --windows --display 1 | jq '[.[] | select(."is-visible"==true and ."is-floating"==false)] | length')

if [[ $windows == 1 ]]; then
	yabai -m config left_padding 200
	yabai -m config right_padding 200
	yabai -m space --balance
else
	yabai -m config layout bsp
	yabai -m config top_padding 0
	yabai -m config bottom_padding 0
	yabai -m config left_padding 0
	# NOTE: for OBS floating head
	# yabai -m config left_padding                 450
	yabai -m config right_padding 0
	yabai -m config window_gap 0
fi

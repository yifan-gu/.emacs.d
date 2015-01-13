#!/bin/bash

# map keys back under ubuntu, see remapkey.sh for details

xmodmap -e "keycode 66 = Caps_Lock"
xmodmap -e "keycode 37 = Control_L"
xmodmap -e "keycode 22 = BackSpace BackSpace BackSpace BackSpace" 
xmodmap -e "keycode 51 = backslash bar backslash bar" 

#!/bin/bash

# remap some keys under ubuntu for emacs/hhkb users

# remap `\' to BackSpace
# remap BackSpace to `\'
xmodmap -e "keycode 51 = BackSpace" 
xmodmap -e "keycode 22 = backslash" 

# remap Caps_Lock to Control_L
# remap Control_L to Caps_Lock
xmodmap -e "clear lock"
xmodmap -e "keysym Control_L = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Lock = Caps_Lock"
xmodmap -e "add Control = Control_L"
xmodmap -e "keycode 37 = Caps_Lock"
xmodmap -e "keycode 66 = Control_L"

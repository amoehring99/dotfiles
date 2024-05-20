#! /bin/bash
if [[ $(pgrep -l xmobar) ]]
then
  pkill xmobar
else
  xmobar /home/amoehring99/.xmonad/.xmobarrc
fi

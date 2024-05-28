#########################
### x session options ###
#########################

# set mouse acceleration to 0
xset m 0 0

# disable screen saver blanking
xset s off

# set default cursor
xsetroot -cursor_name left_ptr

# load xresources (configuration parameters for X client applications)
# xrdb -load ~/.Xresources

##############################
### autostart applications ###
##############################

# set monitor layout given in ~/.screenlayout/standardLayout.sh
~/.screenlayout/standardLayout.sh

# hide mouse cursor when typing
xbanish -s -t 3 &
# polkit agent for authentication
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# notification daemon
dunst &
# session manager
# lxsession &

# start tmux session
kitty tmux &

# wait for applications to start (not mandatory)
sleep 2

# start xmonad
exec xmonad

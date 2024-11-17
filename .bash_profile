#
# ~/.bash_profile
#

# User specific environment (add xmonad and other files in ~/.local/bin)
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# # autostart xmonad on tty1
# if [[ "$(tty)" = "/dev/tty1" ]]; then
# 	pgrep xmonad || startx "$HOME/.xinitrc"
# fi

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Added by Toolbox App
export PATH="$PATH:/home/amoehring99/.local/share/JetBrains/Toolbox/scripts"

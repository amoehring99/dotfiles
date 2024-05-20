#
# ~/.bash_profile
#

# User specific environment (add xmonad and other files in ~/.local/bin)
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# autostart xmonad on tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep xmonad || startx "$HOME/.xinitrc"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Added by Toolbox App
export PATH="$PATH:/home/amoehring99/.local/share/JetBrains/Toolbox/scripts"

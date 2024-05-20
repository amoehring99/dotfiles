how to run: https://brianbuccola.com/how-to-install-xmonad-and-xmobar-via-stack/
xmobar code from: https://codeberg.org/xmobar/xmobar.git

Update tldr: 
cd ~/.xmonad
stack install

ISSUES in the past:
xmonad was not in the PATH at the time display manager tried to run it, even when exported in ~/.profile and ~/.bash_profile
solution: instead of using a display manager, use startx to start xmonad, configured in ~/.xinitrc. startx is automaticlly run on login defined in ~/.bash_profile

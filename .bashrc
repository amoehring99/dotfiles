# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# PATH environment variables
export PATH="/home/A1ge6ra/src/systemverilog-toolchain/sv2v-Linux:$PATH"

# vim keybindings in bash
set -o vi

export EDITOR="/usr/bin/nvim"
EDITOR=nvim
VISUAL=nvim

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

### OPEN NEOFETCH ###
if [[ $(echo $TERM | grep kitty) ]]; then
	neofetch --colors 4 15 15 4 4 15 --underline --xoffset 3 --yoffset 1 --gap 6 --size 19% --kitty /home/amoehring99/Pictures/neofetch/arch_purple.png
fi
#

### tmuxifier
if ! [[ "$PATH" =~ "$HOME/.tmux/plugins/tmuxifier/bin:" ]]; then
	 PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
fi
export PATH

eval "$(tmuxifier init -)"

### START SSH AGENT ###
eval "$(ssh-agent -s)" &>/dev/null

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	. "$NVM_DIR/nvm.sh"                   # This loads nvm
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
	. "$NVM_DIR/bash_completion"           # This loads nvm bash_completion
fi

# virtualenvwrapper (commands for pip environments)
export WORKON_HOME=~/.virtualenvs
if [ -f /usr/bin/virtualenvwrapper_lazy.sh ]; then
    source /usr/bin/virtualenvwrapper_lazy.sh
fi

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# fzf dracula theme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# command line history with fzf
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
shopt -s histappend

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

if [ -f ~/fzf-git.sh/fzf-git.sh ]; then
    source ~/fzf-git.sh/fzf-git.sh
fi

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# set theme for bat (cat with highlighting)
export BAT_THEME="Dracula"

# thefuck alias (correct command typo)
eval $(thefuck --alias)

export GTK_OVERLAY_SCROLLING=0

# ---- Vivado ---
if [ -f /tools/Xilinx/Vivado/2023.2/settings64.sh ]; then
    source /tools/Xilinx/Vivado/2023.2/settings64.sh
fi
export _JAVA_AWT_WM_NONREPARENTING=1

# node version manager
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi

# User specific aliases and functions
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/amoehring99/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/amoehring99/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/amoehring99/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/amoehring99/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### bob, a neovim version manager
if ! [[ "$PATH" =~ "$HOME/.local/share/bob/nvim-bin:" ]]; then
	 PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi
export PATH

# Source GHC Haskell compiler via GHCup
if [[ ":$PATH:" != *":$HOME/.ghcup/bin:"* ]]; then
  export PATH="$HOME/.ghcup/bin:$PATH"
fi

# >>> ros2 setup >>>

# source all fils needed using command ros2_on
ros2_on(){
     export ROS_DOMAIN_ID=27
     export ROS_VERSION=2
     export ROS_PYTHON_VERSION=3
     export ROS_DISTRO=jazzy
     # source ros2
     source /opt/ros/jazzy/setup.bash

     # auto completion for colcon for ros2
     if [ -f /usr/share/colcon_argcomplete/hook/colcon-argcompile.bash ]; then
       source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
     fi

     # source custom ros2 workspace
     if [ -f "$HOME/git/amoehring99-bachelor-thesis/ROS2/ros2_ws/install/setup.bash" ]; then
       source $HOME/git/amoehring99-bachelor-thesis/ROS2/ros2_ws/install/setup.bash
     fi

     # setup colcon_cd
     source /usr/share/colcon_cd/function/colcon_cd.sh
     export _colcon_cd_root=/opt/ros/jazzy/
     conda activate ros-env
}

#always source ros2 in rosbox container
if [[ $(echo $CONTAINER_ID | grep rosbox) ]]; then
  clear
  ros2_on
fi

# <<< ros2 setup <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

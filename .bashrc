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

# User specific aliases and functions

# compiler flags
alias gpp='g++ -O2 -DNDEBUG -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23'

# Program alias

alias open='handlr open'
alias cat='bat'
alias la='eza -a --group-directories-first'
alias ll='eza -l --group-directories-first --icons -l -a -a -b -h -H -i -m'
alias ls='eza -l --group-directories-first --icons --no-user --no-permissions --no-time --no-filesize'
alias vim='nvim'
alias vi='nvim'
alias firewall='sudo ufw'
# ATTENTION: keep in mind that vivado spawns .Xil files everyhere it is started
alias vivado='vivado -nolog -nojournal & disown > /dev/null'
alias backup='sudo timeshift'
alias files='mc'
alias audio='alsamixer'
alias vol='audio'
alias editor='nvim'
alias pdf='sioyek & disown > /dev/null'
alias pdf-merge='qpdf --empty --pages'
alias pdf-present='pdfpc -n right -s'
alias calc='gcalccmd'
alias haskell='stack ghci'
alias prolog='swipl'
alias hterm='~/UNI/_SS23/MobileRoboter/HTerm/hterm-linux-64/hterm configuration.cfg'
alias zulip='source ~/zt_venv/bin/activate;zulip-term'
alias ccs='/home/A1ge6ra/ti/ccs1230/ccs/eclipse/ccstudio'
alias wallpaper='nitrogen'
alias imageviewer='gthumb'
alias bt='printf "devices" | bluetoothctl | grep "Device" && printf "\n" && bluetoothctl'
alias wlan='nmtui'
alias yt='freetube & disown > /dev/null'
alias events='xev'
alias xmonadrc='code /home/A1ge6ra/.xmonad/'
alias bwsync='~/Applications/bwSyncShare-Linux64-3.9.3-build-17255.AppImage'
alias mc=". /usr/lib/mc/mc-wrapper.sh"
alias battery='battop'
alias vpn='/home/amoehring99/VPN/vpn.sh'
alias monitor='arandr & disown > /dev/null'
alias timer='termdown'
alias layout='setxkbmap -layout'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl" 
alias mouse='piper &'

# Quality of life alias

alias f='fzf'
alias cd='z'
alias b='cd ./..'
alias c='clear'
alias off='shutdown -h now'
alias suspend='systemctl suspend'
alias search='sudo find / -name $1 2> /dev/null'
alias bashrc='nvim ~/.bashrc'
alias update='yay'
alias lint='./lint.sh'
alias o='fd --type f --hidden | fzf-tmux -p --reverse | xargs nvim'
alias t='tmux'
alias verilog='source ~/fpga_toolchain/apio/venv/bin/activate'
# git commmand to keep track of dotfiles
alias config='/usr/bin/git --git-dir=/home/amoehring99/.cfg/ --work-tree=/home/amoehring99'
alias mountGames='sudo mount UUID=ae684089-708c-4b03-ae00-1a6d926e7060 ~/Games/'
# generate compile_commands.json for clangd
alias clangdinit='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1'

# Uni alias

alias it1_praktikum='cd ~/UNI/_SS23/Informationstechnik/Praktikum/itworkspace/Gruppe_022/;
                 open ~/UNI/_SS23/Informationstechnik/Praktikum/assignments/Handbuch_Informationstechnik_1_Praktikum.pdf;
                 open ~/UNI/_SS23/Informationstechnik/Praktikum/assignments/Hilfreiche\ Dokumente\ und\ Datenblaetter/TivaWare\(TM\)\ Treiberbibliothek.pdf;
                 open ~/UNI/_SS23/Informationstechnik/Praktikum/assignments/Hilfreiche\ Dokumente\ und\ Datenblaetter/HC-SR04_ultraschallmodul_beschreibung_3.pdf'
alias itec='cd ~/HiWi-ITEC/SS23/'
alias uni='cd ~/UNI/_SS24'
alias tt='xdg-open ~/UNI/_SS23/stundenplan.pdf'
alias eee='cd ~/UNI/_WS22_23/Erzeugung\ elekrischer\ Energie/;
           xdg-open ~/UNI/_WS22_23/Erzeugung\ elekrischer\ Energie/EEE_Skript_2022_2023.pdf;
           xdg-open ~/UNI/_WS22_23/Erzeugung\ elekrischer\ Energie/EEE_Themen.pdf;
           xdg-open ~/UNI/_WS22_23/Erzeugung\ elekrischer\ Energie/EEE_Cheat_Sheet.pdf'
alias mp1='xdg-open ~/UNI/_SS23/Mikroprozessoren/VL/MP-Complete.pdf;
           cd ~/UNI/_SS23/Mikroprozessoren/Protokolle/compressed/ProtokolleMP1_compressed/'
alias rs='cd ~/UNI/_SS23/Rechnerstrukturen/;
          xdg-open ~/UNI/_SS23/Rechnerstrukturen/VL/RS23-VL-Complete.pdf'
alias es='cd ~/UNI/_SS23/Echtzeitsysteme/;
          xdg-open ~/UNI/_SS23/Echtzeitsysteme/VL/ES23-VL-Complete.pdf'
alias it='cd ~/UNI/_SS23/Informationstechnik/Klausurvorbereitung/;
          open ~/UNI/_SS23/Informationstechnik/VL/it1Complete.pdf;
          open ~/UNI/_SS23/Informationstechnik/FormelsammlungIT1.pdf'
alias formsys='cd ~/UNI/_SS23/FormaleSysteme/Altklausuren/;
               open ~/UNI/_SS23/FormaleSysteme/Formsys_Skript22.pdf'
alias numerik='cd ~/UNI/_SS23/Numerik/;
               open ~/UNI/_SS23/Numerik/NumerikSkript23.pdf;
               open ~/UNI/_SS23/Numerik/NumerikFolienZusammenfassung.pdf;'
alias parallelrechner='cd ~/UNI/_SS23/Parallelrechner;
                       open ~/UNI/_SS23/Parallelrechner/VL/prPruefungsrelevant.pdf'
alias lsd='cd ~/UNI/_WS23_24/LSD/'
alias lsdgit='cd ~/git/lsd/'
alias rn='cd ~/UNI/_WS23_24/Rechnernetze/'
alias db='cd ~/UNI/_WS23_24/Datenbanken/'
alias gki='cd ~/UNI/_WS23_24/GKI/'
alias propa='cd ~/UNI/_SS24/Propa/'
alias wt='cd ~/UNI/_SS24/Wahrscheinlichkeitstheorie/'
alias robo='cd ~/UNI/_SS24/Robotik'
alias ep='cd ~/UNI/_SS24/EffizientesProgrammieren/'
alias fpga='cd ~/UNI/_SS24/FpgaProgramming/'
alias hso='cd ~/UNI/_SS24/HWSynthese/'
alias lpd='cd ~/UNI/_SS24/LowPowerDesign/'
alias ml='cd ~/UNI/_SS24/MLNaturwissenschaften/'
alias ba='cd ~/UNI/BA'

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

### INIT STARSHIP BASH PROMPT ###
__main() {
	local major="${BASH_VERSINFO[0]}"
	local minor="${BASH_VERSINFO[1]}"

	if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
		source <(/usr/bin/starship init bash --print-full-init)
	else
		source /dev/stdin <<<"$(/usr/bin/starship init bash --print-full-init)"
	fi
}
__main
unset -f __main

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# virtualenvwrapper (commands for pip environments)
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

# miniconda
#. /usr/etc/profile.d/conda.sh
#conda activate
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh source /home/amoehring99/.bashrc

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

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
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

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

# ---- Zoxide (better cd) ----
eval "$(zoxide init bash)"

export GTK_OVERLAY_SCROLLING=0


# ---- Vivado ---
source /tools/Xilinx/Vivado/2023.2/settings64.sh
export _JAVA_AWT_WM_NONREPARENTING=1

# node version manager
source /usr/share/nvm/init-nvm.sh

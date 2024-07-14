# User specific aliases and functions
# compiler flags
alias gpp='g++ -O2 -DNDEBUG -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23'


# Program alias

alias open='handlr open'
alias mkdir='mkdir -p -v'
alias grep='grep --color=always'
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

# open file with fzf and bat preview in terminal
# alias f='open $(find . -type f | fzf -m --preview "bat --color=always --style=header,grid --line-range :500 {}")'

# open file from CURRENT directory with fzf and bat preview in popup window
alias f='f_func'
# open file from HOME directory with fzf and bat preview in popup window
alias fa='fa_func'
# open directory from CURRENT directory with fzf and exa preview in popup window
alias cd='cd_func'
# open directory from HOME directory with fzf and exa preview in popup window
alias cda='cda_func'
# create directory and cd into it
alias mkcd='mkcd_func'

alias ..='cd ..'
alias ...='cd ../..'
alias h='cd ~'
alias c='clear'
alias off='shutdown -h now'
alias suspend='systemctl suspend'
alias bashrc='nvim ~/.bashrc'
alias update='yay'
alias lint='./lint.sh'
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

mkcd_func ()
{
  mkdir -p -- "$1" && cd -P -- "$1" || return
}

########################################################################################################################################
######################################################## fuzzy finder functions ########################################################
########################################################################################################################################

# Helper function to select files or directories to fuzzy find from using fd
fd_select() {
    local type=$1
    local base_dir=${2:-"."}
    local depth=${3:-}

    if [[ -z "$depth" ]]; then
        if [[ "$base_dir" == "." ]]; then
            fd --type "$type" --hidden
        else
            fd --type "$type" --hidden --absolute-path --base-directory "$base_dir"
        fi
    else
        if [[ "$base_dir" == "." ]]; then
            fd --type "$type" --hidden --max-depth "$depth"
        else
        fd --type "$type" --hidden --max-depth "$depth" --absolute-path --base-directory "$base_dir"
        fi
    fi
}

# Helper function to open files using fzf and bat preview
fzf_select_file() {
    local base_dir=${1:-"."}
    local depth=$2

    local selected_files
    selected_files=$(fd_select "f" "$base_dir" "$depth" | fzf -m --tmux 65% --reverse --preview "bat --color=always --style=header,grid --line-range :500 {}")
    if [ -n "$selected_files" ]; then
        handlr open "$selected_files"
        echo "   ↪ Opened '$selected_files'"
        echo "handlr open $selected_files" >> ~/.bash_history
    else
        echo "    ↪ No file selected."
    fi
}

# Helper function to select directories using fzf
fzf_select_dir() {
    local base_dir=${1:-"."}

    local selected_dir
    selected_dir=$(fd_select "d" "$base_dir" | fzf --tmux 65% --reverse --preview "exa -l --group-directories-first --icons --no-user --no-permissions --no-time --no-filesize {}")
    if [ -n "$selected_dir" ]; then
        command cd "$selected_dir" || return
        echo "   ↪ cd into '$selected_dir'"
        echo "cd $selected_dir" >> ~/.bash_history
    else
        echo "    ↪ No directory selected."
    fi
}

# Open file with fzf and bat preview in popup
f_func() {
    fzf_select_file "." "$1"
}

# If cd is called without arguments, use fzf to select a directory to cd into
cd_func() {
    if [ $# -eq 0 ]; then
        fzf_select_dir "."
    else
        command cd "$@" || return
        printf "cd %s\n" "$@" >> ~/.bash_history
    fi
}

# Change directory from home directory using fzf
cda_func() {
    fzf_select_dir "$HOME"
}

# Open file from home directory with fzf and bat preview in popup
fa_func() {
    fzf_select_file "$HOME"
}

########################################################################################################################################
################################################################# end ##################################################################
########################################################################################################################################

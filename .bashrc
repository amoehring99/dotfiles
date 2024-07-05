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
source "$HOME/.bash_aliases"

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

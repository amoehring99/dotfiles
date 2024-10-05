if status is-interactive
    # Set the cursor shapes for the different vi modes.
  set fish_cursor_default     block      blink
  set fish_cursor_insert      line       blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_visual      block
end

# set theme for bat (cat with highlighting)
set -x BAT_THEME "Dracula"

# tmuxifier
set -gx PATH "$HOME/.tmux/plugins/tmuxifier/bin" $PATH
eval (tmuxifier init - fish)

# neovim version manager
set nvim_bin_path "$HOME/.local/share/bob/nvim-bin"
if not contains $nvim_bin_path $PATH
    set -gx PATH $nvim_bin_path $PATH
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/amoehring99/anaconda3/bin/conda
    eval /home/amoehring99/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/amoehring99/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/amoehring99/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/amoehring99/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# ~/.config/fish/config.fish
#starship init fish | source

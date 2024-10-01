function fzf_select_dir
    set base_dir $argv[1]

    if test -z "$base_dir"
        set base_dir "."
    end

    set selected_dir (fd_select "d" "$base_dir" | fzf --tmux 65% --reverse --preview "exa -l --group-directories-first --icons --no-user --no-permissions --no-time --no-filesize {}")
    if test -n "$selected_dir"
        cd "$selected_dir" || return
        echo "   ↪ cd into '$selected_dir'"
        echo "cd $selected_dir" >> ~/.fish_history
    else
        echo "    ↪ No directory selected."
    end
end

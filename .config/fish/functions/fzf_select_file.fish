function fzf_select_file
    set base_dir $argv[1]
    set depth $argv[2]

    if test -z "$base_dir"
        set base_dir "."
    end

    set selected_files (fd_select "f" "$base_dir" "$depth" | fzf -m --tmux 65% --reverse --preview "bat --color=always --style=header,grid --line-range :500 {}")
    if test -n "$selected_files"
        handlr open "$selected_files"
        echo "   ↪ Opened '$selected_files'"
        echo "handlr open $selected_files" >> ~/.fish_history
    else
        echo "    ↪ No file selected."
    end
end

function fd_select
    set type $argv[1]
    set base_dir $argv[2]
    set depth $argv[3]

    if test -z "$depth"
        if test "$base_dir" = "."
            fd --type "$type" --hidden
        else
            fd --type "$type" --hidden --absolute-path --base-directory "$base_dir"
        end
    else
        if test "$base_dir" = "."
            fd --type "$type" --hidden --max-depth "$depth"
        else
            fd --type "$type" --hidden --max-depth "$depth" --absolute-path --base-directory "$base_dir"
        end
    end
end

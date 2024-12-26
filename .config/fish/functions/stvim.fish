function stvim
    set max_depth 3
    set debug_dir ""
    set original_dir (pwd)

    # Search down
    set debug_dir (find . -maxdepth $max_depth -type d -name "Debug" | head -n1)

    # If not found, search up
    if test -z "$debug_dir"
        set current_dir (pwd)
        for i in (seq 1 $max_depth)
            set parent_dir (dirname $current_dir)
            set debug_dir (find $parent_dir -maxdepth $max_depth -type d -name "Debug" | head -n1)
            if test -n "$debug_dir"
                break
            end
            set current_dir $parent_dir
        end
    end

    if test -n "$debug_dir"
        cd $debug_dir
        make clean
        make VERBOSE=y all > make_output.txt 2>&1
        compiledb --parse make_output.txt
        rm make_output.txt
        # mv compile_commands.json ../../
        mv compile_commands.json $original_dir
        cd $original_dir
    else
        echo "Debug directory not found within $max_depth levels up or down"
        return 1
    end
end

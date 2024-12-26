function rosws
    set container_name "rosbox"
    # Enter the Distrobox
    distrobox enter $container_name -- /bin/bash -c "
        # Wait for the shell to be ready
        while ! pgrep -u \$(id -u) fish; do sleep 0.5; done
        # Start Fish shell and run Neovim
        exec fish -c 'nvim -S Session.vim'
    "
end

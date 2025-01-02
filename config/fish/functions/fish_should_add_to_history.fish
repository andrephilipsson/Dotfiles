function fish_should_add_to_history
    # Check if the command starts with a space
    if test (string match -r '^\s+' "$argv[1]")
        return 1  # Do not add to history
    end

    # Call the original function for other commands
    return (command fish_should_add_to_history $argv)
end

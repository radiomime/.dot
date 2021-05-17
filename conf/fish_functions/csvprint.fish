function csvprint
    cat $argv[1] | column -s, -t | bat
end

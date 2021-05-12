if status --is-interactive
    abbr --add --global mk 'mkdir -pv'
    abbr --add --global v 'nvim'
    abbr --add --global b 'bat'
    abbr --add --global c 'clear'
    abbr --add --global l 'ls'
    abbr --add --global ll 'ls -alth'
    abbr --add --global x 'chmod +x'
    abbr --add --global ts 'tmux ls'
    abbr --add --global tn 'tmux new -s'
    abbr --add --global ta 'tmux a -t'
end

# Starship at the end of fish config
starship init fish | source

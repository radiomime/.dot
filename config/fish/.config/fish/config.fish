# TODO: add a git signin method!
# TODO: add ssh-add to fish start
#

if status --is-interactive
    abbr --add --global mk 'mkdir -pv'
    abbr --add --global v 'nvim'
    abbr --add --global b 'bat'
    abbr --add --global c 'clear'
    abbr --add --global l 'exa'
    abbr --add --global ll 'exa --long --all'
    abbr --add --global lll 'exa --long --all --tree --level=2'
    # abbr --add --global l 'ls'
    # abbr --add --global ll 'ls -alth'
    abbr --add --global x 'chmod +x'
    abbr --add --global ts 'tmux ls'
    abbr --add --global tn 'tmux new -s'
    abbr --add --global ta 'tmux a -t'
    abbr --add --global bw 'bandwhich --dns-server 1.1.1.1'
    abbr --add --global we 'watchexec --'
    abbr --add --global sshkitty 'kitty +kitten ssh'
end

# add ssh keys
for ssh_key in $HOME'/.ssh/keys'/*
    ssh-add $ssh_key 2>/dev/null
end

# rust path
# set PATH $HOME/.cargo/bin $PATH

# Starship at the end of fish config
starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zpuser/google-cloud-sdk/path.fish.inc' ]; . '/Users/zpuser/google-cloud-sdk/path.fish.inc'; end
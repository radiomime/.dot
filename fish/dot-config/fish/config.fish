# TODO: add a git signin method!
# TODO: add ssh-add to fish start

if status --is-interactive
    abbr --add --global mk 'mkdir -pv'
    abbr --add --global v nvim
    abbr --add --global b bat
    abbr --add --global c clear
    abbr --add --global l exa
    abbr --add --global ll 'exa --long --all'
    abbr --add --global lll 'exa --long --all --tree --level=2'
    abbr --add --global x 'chmod +x'
    abbr --add --global ts 'tmux ls'
    abbr --add --global tn 'tmux new -s'
    abbr --add --global ta 'tmux a -t'
    abbr --add --global bw 'bandwhich --dns-server 1.1.1.1'
    abbr --add --global we 'watchexec --'
    abbr --add --global sshkitty 'kitty +kitten ssh'
    abbr --add --global rip 'rip --graveyard ~/.local/share/graveyard'
    abbr --add --global r 'npm run'
    abbr --add --global t 'npm run test'
    abbr --add --global td 'npm run test-dev'
    abbr --add --global lg lazygit
    abbr --add --global cht 'cht.sh'
    abbr --add --global cheat curl -sL https://cheat.sh/
end

# add ssh keys
for ssh_key in $HOME'/.ssh'/*
    ssh-add $ssh_key 2>/dev/null
end
for ssh_key in $HOME'/.ssh/keys'/*
    ssh-add $ssh_key 2>/dev/null
end

if test -e /opt/homebrew/bin
    contains /opt/homebrew/bin $fish_user_paths; or set -Ua fish_user_paths /opt/homebrew/bin
end

if test -d $HOME/.cargo/bin
    contains $HOME/.cargo/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.cargo/bin
end

if type -q go
    and test -d (go env GOPATH)
    contains (go env GOPATH)/bin $fish_user_paths; or set -Ua fish_user_paths (go env GOPATH)/bin
end

# poetry lives here by default
if test -e $HOME/.local/bin
    contains $HOME/.local/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/bin
end

if type -q pyenv
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
    # status --is-interactive; and pyenv virtualenv-init - | source
end

# read computer specific config.
if test -e ~/.config/fish/(hostname).config.fish
    source ~/.config/fish/(hostname).config.fish
else
    echo "no computer specific config found"
    echo was trying to source: ~/.config/fish/(hostname).config.fish
    echo ~/.config/fish/(hostname).config.fish
end

# Starship at the end of fish config
starship init fish | source

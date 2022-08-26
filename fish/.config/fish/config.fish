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
    abbr --add --global x 'chmod +x'
    abbr --add --global ts 'tmux ls'
    abbr --add --global tn 'tmux new -s'
    abbr --add --global ta 'tmux a -t'
    abbr --add --global bw 'bandwhich --dns-server 1.1.1.1'
    abbr --add --global we 'watchexec --'
    abbr --add --global sshkitty 'kitty +kitten ssh'
    abbr --add --global rip 'rip --graveyard ~/.local/share/graveyard'
end

# add ssh keys
for ssh_key in $HOME'/.ssh'/*
    ssh-add $ssh_key 2>/dev/null
end
for ssh_key in $HOME'/.ssh/keys'/*
    ssh-add $ssh_key 2>/dev/null
end


# add to path!
if test -e '/opt/homebrew/bin'
  echo adding brew to fish_user_paths
  contains /opt/homebrew/bin $fish_user_paths; or set -Ua fish_user_paths /opt/homebrew/bin
end

# if test -e '$HOME/.cargo/bin'
if test -d $HOME/.cargo/bin
  contains $HOME/.cargo/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.cargo/bin
end

# Pyenv
if type -q pyenv
  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source
  # status --is-interactive; and pyenv virtualenv-init - | source
end


# conda
if type -q conda
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
  # <<< conda initialize <<<
end


# Starship at the end of fish config
starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zpuser/google-cloud-sdk/path.fish.inc' ]; . '/Users/zpuser/google-cloud-sdk/path.fish.inc'; end



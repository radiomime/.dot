function uuu
    # brew packages
    if type -sq brew
        echo '*** installing brew packages ***'
        command brew install \
            black \
            fish \
            go \
            isort \
            lazygit \
            lazydocker \
            neovim \
            stow \
            fzf \
            tmux
    end
end

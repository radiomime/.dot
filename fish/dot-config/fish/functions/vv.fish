function vv
    # Assumes all configs exist in directories named ~/.config/nvim-*
    # set config (fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)
    set config (
        fd \
        --max-depth 1 \
        # --glob '*' ~/.config \
        --glob 'nvim*' ~/.config \
        # --glob 'nvim-*' ~/.config \
        | \
        fzf \
        --prompt="Neovim Configs > " \
        --height=~50% \
        --layout=reverse \
        --border \
        --exit-0\
    )

    # If I exit fzf without selecting a config, don't open Neovim
    if test -z $config
        echo "No config selected"
        return
    end

    # Open Neovim with the selected config
    set -x NVIM_APPNAME (basename $config)

    nvim $argv
end

# configuration specific for pop os

# conda activation
if type -q conda
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval /home/matt/miniconda3/bin/conda "shell.fish" hook $argv | source
    # <<< conda initialize <<<
end

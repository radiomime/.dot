# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/mattwright/miniconda3/bin/conda
    eval /Users/mattwright/miniconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mattwright/google-cloud-sdk/path.fish.inc' ]
    . '/Users/mattwright/google-cloud-sdk/path.fish.inc'
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/mattwright/miniconda3/bin/conda
    eval /Users/mattwright/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/Users/mattwright/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/mattwright/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /Users/mattwright/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

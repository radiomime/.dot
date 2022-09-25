# configuration specific for workbook

# conda activaion
if type -q conda
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
    # <<< conda initialize <<<
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zpuser/google-cloud-sdk/path.fish.inc' ]
    . '/Users/zpuser/google-cloud-sdk/path.fish.inc'
end

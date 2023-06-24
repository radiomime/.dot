alias pulumi_cred='GOOGLE_APPLICATION_CREDENTIALS=$(pulumi config get gcp:credentials) pulumi'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /usr/local/Caskroom/miniconda/base/bin/conda
    eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zpuser/google-cloud-sdk/path.fish.inc' ]
    . '/Users/zpuser/google-cloud-sdk/path.fish.inc'
end

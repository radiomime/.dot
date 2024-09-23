alias pulumi_cred='GOOGLE_APPLICATION_CREDENTIALS=$(pulumi config get gcp:credentials) pulumi'

conso
fish_add_path /Applications/Cursor.app/Contents/MacOS

echo about to init conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /usr/local/Caskroom/miniconda/base/bin/conda
    eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

# google cloud sdk through brew
echo activate base for google cloud sdk
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zpuser/google-cloud-sdk/path.fish.inc' ]
    . '/Users/zpuser/google-cloud-sdk/path.fish.inc'
end

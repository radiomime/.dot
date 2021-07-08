## ToDo

Add the fo.llowing!
brew install efm-langserver

efm-langserver config symlink


Things to checkout, incorporate, etc.

## shell management
fish on uninstall should check for shell as available shells!

CARGO INSTALL ripgrep! At least for linux

## popos specific gui plugins?

## kubect install minikube and docker, etc

* indicator-sensors
* `https://github.com/kgshank/gse-sound-output-device-chooser`

### Move filetype specific things to ftplugin

Checkout
* https://github.com/dense-analysis/ale#2ii-fixing
* https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean
* https://vim.fandom.com/wiki/File_type_plugins

### npm to install

### FZF + ripgrep

### Good with fugitive
https://github.com/idanarye/vim-merginal

### docker and docker-compose to install

Remember to add the sudoers user mod so no sudo is needed for the user

https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8

https://github.com/docker/compose/releases

### Mac compatability

Runnable on mac

### Uninstalls
Put unintalls everywhere

### Add poetry to install

add it

### Checkout (for typescript)

https://github.com/Quramy/tsuquyomi

### jupyter?
```
pip3 install jupyterlab
```

### fuzzyfinder
from command line? rust implementation?

### Editor speed

Chris A sent this over:
```
sped up my editor quite a bit, passing on the knowledge:

install eslint_d as a top level dev dependency
(or you can install globally to not break your other projects once you update vimrc).

yarn add eslint_d --dev -W

Remove prettier as a fixer if you had it in your ale config;
it was running twice for me, once through the eslint plugin and once standalone.

let g:ale_fixers = {
…
\ 'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\ 'typescript': ['eslint', 'remove_trailing_lines', 'trim_whitespace']
…
}

Change the eslint command for ALE.

let g:ale_javascript_eslint_executable = 'eslint_d --cache'
let g:ale_typescript_eslint_executable = 'eslint_d --cache'


In the root package.json scripts, update the commands to use eslint_d.

"lint": "eslint_d --cache <..same as before> --fix",
"lint:restart": "eslint_d restart && yarn lint",

The restart command restarts the eslint daemon.
I had to run it after I updated a package as I was getting
errors that eslint couldn't import the airbnb plugin.

The first run of yarn lint or save in vim that runs the fixer is
still slowish, but once the eslint daemon is started, every save
after was super quick compared to what it was for me.
```

### Vim Markup

Checkout vim markup

### Vim UML Markup

Checkout:
1. https://github.com/bramp/js-sequence-diagrams
2. https://vimawesome.com/plugin/markdown-preview-nvim
    * Seems like a really good option. Markdown && js-sequence-diagrams

Two clear options:
1. https://github.com/scrooloose/vim-slumlord
2. https://github.com/xavierchow/vim-sequence-diagram

### Indent line plugin
What is it? Gave me some weird issues regarding whitespace in my readme files


### New Plugin:
Should help with leaderkey usage --ethan
```
" Provide hints about leader key bindings
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
```

### tmux plugins

```
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'egel/tmux-gruvbox'
set -g @plugin 'laktak/extrakto'
set -g @plugin 'tmux-plugins/tmux-yank'
```

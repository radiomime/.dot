## ToDo

Things to checkout, incorporate, etc.

### Move filetype specific things to ftplugin

Checkout
* https://github.com/dense-analysis/ale#2ii-fixing
* https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean
* https://vim.fandom.com/wiki/File_type_plugins

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

### Indent line plugin
What is it? Gave me some weird issues regarding whitespace in my readme files


### New Plugin:
Should help with leaderkey usage --ethan
```
" Provide hints about leader key bindings
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
```

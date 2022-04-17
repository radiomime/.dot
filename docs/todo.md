## ToDo

## install

add /opt/homebrew to brew remove** scripts!!

## Look into plugins:

`nyngwang/NeoRoot.lua`

https://github.com/nacro90/numb.nvim

he has cool plugins:
https://github.com/ChristianChiarulli/nvim

## opener

Check this out for `cd` functionality: https://github.com/willthbill/opener.nvim

## autocmds in lua

https://www.reddit.com/r/neovim/comments/t98zhs/short_demo_of_lua_autocmds_by_author_of_lua/

## snippets

* Look through snippets tool

## prettier default files


```yaml
# .prettierrc or .prettierrc.yaml
trailingComma: "es5"
tabWidth: 2
semi: true
singleQuote: true
printWidth: 80
overrides:
  - files: "*.json"
    options:
      tabWidth: 2

```

## tssserver

- inlay hints? I might have this disabled somewhere

## readme

- install instructions
- pyenv install
- nvm or similar instructions
- uninstall instructions
- uninstall simple commands
- reinstall

## cargo installs

- move all cargo installs to readme
- fd package! it isn't just "fd"
- watchexec

## git author

Fish should have some alias for signing in as personal/work

## gitignore

TODO: ignore functions, then include functions I want to include

## fisher

add fisher plugin: z
fisher: install plugins on uu

## snippets

look at https://github.com/L3MON4D3/LuaSnip a little more, could be useful for snippets

## cht.sh

Checkout cheat.sh, might be cool to use. Might be able to turn this into a
terminal app. https://github.com/chubin/cheat.sh

https://www.youtube.com/watch?v=hJzqEAf2U4I
https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-cht.sh

This also looks neat: https://devhints.io/fish-shell

## rando

add general fix plugin structure.

add to gitconfig: default branch name

Add gitignore command to fish instead of bash

install prettier:
npm install -g prettier
maybe this too?
npm install -g eslint_d

add cargo install stylua
add:
go get github.com/jesseduffield/lazygit
also, add to path: ~/go/bin
fish_add_path ~/go/bin/
Do this for the cargo stuff too!
Actually, do gitui instead! Or maybe not, for author stuff.

# Weird installs

- check docker, neovim, and brew. They can be weird to uninstall and reinstall

# python package installer folder hierarchy

- clean it!
- maybe this is all in a folder at the base?
- good opportunity to learn python development patterns
- Should I specify return types and such?

# rust packages

fd-find add!:
https://github.com/sharkdp/fd

new top?
https://github.com/ClementTsang/bottom

Rust, should I put locked into command?

Cargo:
https://github.com/ClementTsang/bottom

# config

change around conf file to have program specific config dirs at the top level

With this, update the "dot" class

# How about docker revisit

there is a docker helper install script for development. How about doing this?
Any prod system should have docker manually installed or a custom installer to
fit the prod system's needs, anyways.

# lsp

Add the following!
brew install efm-langserver

efm-langserver config symlink

Things to checkout, incorporate, etc.

## shell management

fish on uninstall should check for shell as available shells!
CARGO INSTALL ripgrep! At least for linux

## shell improvements

fzf for history in fish?

## fish improvement

store fish plugins in dotfiles so I can easily load 'z' and whatnot across machines?

## kubect install minikube and docker, etc

- indicator-sensors
- `https://github.com/kgshank/gse-sound-output-device-chooser`

### Move filetype specific things to ftplugin

Checkout

- https://github.com/dense-analysis/ale#2ii-fixing
- https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean
- https://vim.fandom.com/wiki/File_type_plugins

### npm to install

### standard package managers

- install node version managers (nvm, n?)
- python version manger?

### docker and docker-compose to install

Remember to add the sudoers user mod so no sudo is needed for the user

https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8

https://github.com/docker/compose/releases


### Uninstalls

Put unintalls everywhere

### fuzzyfinder

from command line? rust implementation?

### Vim Markup

Checkout vim markup

### curl gitignore file!

I think this is in bash, do it for fish

### add environment for system

- smart detecting M1 vs x64 vs pi seems error prone

### Vim UML Markup

Checkout:

1. https://github.com/bramp/js-sequence-diagrams
2. https://vimawesome.com/plugin/markdown-preview-nvim
   - Seems like a really good option. Markdown && js-sequence-diagrams

Two clear options:

1. https://github.com/scrooloose/vim-slumlord
2. https://github.com/xavierchow/vim-sequence-diagram

### Indent line plugin

What is it? Gave me some weird issues regarding whitespace in my readme files


### version managers

- node version manager
- python version manager

### poetry

- [completion](https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh)
- should I just link this in readme?

### Yarn install

- Should this be global? Put in readme?
- https://classic.yarnpkg.com/lang/en/docs/install/#debian-stable

### tmux plugins

```
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'egel/tmux-gruvbox'
set -g @plugin 'laktak/extrakto'
set -g @plugin 'tmux-plugins/tmux-yank'
```

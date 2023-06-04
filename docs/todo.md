## ToDo

- Codeium, try to get that installed? Compare to copilot?
- clean nvim tree config, it is all weird and deprecated
- contribute to that one project to use 'dot-'
- https://www.reddit.com/r/neovim/comments/13rh66h/minihipatterns_highlight_patterns_in_text/
- brew install rectangle instead of magnet
- brew install maccy
- https://www.reddit.com/r/neovim/comments/10as1y5/markdownynvim/
- https://reddit.com/r/neovim/comments/ypvrwp/_/ivldnau/?context=1
- brew install sqlfluff
- fix tmux config
- fuzzy find history
- python version manager? Add readme things to know what common commands are. Prune install functions
- toggle autocmand for formatting while writing!
- plugin search on the internet function? not working anymore
- https://github.com/michaelb/sniprun
- nvim-cmp recommends using this for symbols: lspkind
- help in a vertical window: https://www.reddit.com/r/neovim/comments/s4ps1b/helpvsplitnvim_auto_open_help_in_vertical_split/
- maybe clean nvim-cmp?
- [ctop](https://github.com/bcicen/ctop)
- explore tabs
- https://www.npmjs.com/package/prettier-plugin-organize-imports for better imports?

## more to look in to

- neocomposer: https://www.reddit.com/r/neovim/comments/12uou0i/introducing_neocomposer_the_missing_symphony_in/
- color theme: https://www.reddit.com/r/neovim/comments/12puw5m/darkrosenvim_a_lowcontrast_colorscheme_based_on/
- mini colors: https://www.reddit.com/r/neovim/comments/12o5t8l/minicolors_tweak_and_save_any_color_scheme_plus/

## worktrees

- use this: https://github.com/ThePrimeagen/git-worktree.nvim
- and look at this: https://stackoverflow.com/a/31935999/4335339

## switch to conda

- conda install instead of pip install? Should I just move all of those to a readme?
- move go install and conda installs to script in readme? Remove distinctions in mac when possible?
- fish formatter
- fish, load a local config? Per computer? solves for things like conda.
- pip install isort
- pip install sqlfluff
- look into alpha a bit, this seems like this could be better. I have the weird bug where it opens my init file.

## installations i could add

- conda or miniconda
- asdf
- sh and bash fixes
  - cargo install shellharden
  - go install mvdan.cc/sh/v3/cmd/shfmt@latest

```sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# ~/miniconda3/bin/conda init fish
# mkdir -p ~/miniconda3
# bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
# ~/miniconda3/bin/conda init bash
# ~/miniconda3/bin/conda init zsh
# conda config --set auto_activate_base false

```

- https://github.com/ThePrimeagen/refactoring.nvim

## high priority ones!

- nvim-lsp-installer is deprecated, yeah? fix that usage

## asdf

[asdf looks dope](https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies)

- use this for installing several things, like pyenv

## colors

fuzzy find colors? or telescope?

## uu update

- nvm install latest?
  - should ask as a question. could set the universal version, too

## lsp

lsp references: .js files

For fish, [look at this](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)

## autocmds

try to turn on/off format on save with an autocommand and create a whichkey binding.

# checkout

- telescope jump list
- Useful for work projects and lsp file settings: `.git/info/exclude`
- toggle lsp autocommand: https://www.reddit.com/r/neovim/comments/uri2p4/here_is_a_quick_code_snippet_to_toggle_lsp/
- mac homebrew tiling solution? https://formulae.brew.sh/cask/rectangle
- dumb little scratchwork plugin, but seems like I'd use it: https://github.com/m-demare/attempt.nvim
- https://github.com/axieax/urlview.nvim
- tree command, but in rust, and therefore blazingly fast. https://github.com/solidiquis/erdtree
- some neat mentions here: https://www.reddit.com/r/commandline/comments/ul3shx/what_are_some_of_your_favorite_clitui_apps/
- This looks SLICK: https://www.reddit.com/r/neovim/comments/ul1tx3/introducing_ghnvim_a_fully_featured_github/
  - essentially, this should allow me to comment and view issues in a tui
- notify, for pretty logging: https://github.com/rcarriga/nvim-notify
- How about breakpoints and such? https://www.reddit.com/r/neovim/comments/pzlzof/will_we_ever_get_nice_debugging_functionality_in/
  - https://github.com/mfussenegger/nvim-dap
  - https://github.com/rcarriga/nvim-dap-ui
  - https://github.com/Pocco81/dap-buddy.nvim

## Hammerspoon

- [Check out this spoon](https://github.com/Hammerspoon/Spoons/pull/240)
- possibly interesting: https://github.com/jasonrudolph/keyboard/blob/main/hammerspoon/delete-words.lua
- This is the hammerspoon to build from: https://github.com/ashfinal/awesome-hammerspoon
- Also a nice one: https://github.com/jasonrudolph/keyboard/blob/main/hammerspoon/init.lua

# node to do?

These were globally installed packages. This may or may not be useful if I want to replicate

/usr/local/lib
├── corepack@0.10.0
├── n@7.5.0
├── neovim@4.10.0
├── npm@8.5.5
├── prettier@2.5.1
└── yarn@1.22.17

## tmux review

- do I still like and use tmux?
  - could I make my config a bit better? I've never really done much there

## Look into plugins:

`nyngwang/NeoRoot.lua`

https://github.com/nacro90/numb.nvim

he has cool plugins:
https://github.com/ChristianChiarulli/nvim

## opener

- Check this out for `cd` functionality:
  - https://github.com/willthbill/opener.nvim

## autocmds in lua

- https://www.reddit.com/r/neovim/comments/t98zhs/short_demo_of_lua_autocmds_by_author_of_lua/
- https://www.reddit.com/r/neovim/comments/u9ihdt/what_are_your_favorite_autocommands/

## snippets

- Look through snippets tool

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

- add general fix plugin structure.
- add gitignore command to fish instead of bash
- install prettier:
- npm install -g prettier
- maybe this too?
- npm install -g eslint_d
- npm install -g tree-sitter-cli
- add cargo install stylua
- add:
- go get github.com/jesseduffield/lazygit
- also, add to path: ~/go/bin
- fish_add_path ~/go/bin/
- Do this for the cargo stuff too!
- Actually, do gitui instead! Or maybe not, for author stuff.
- cmdheight 0 and disappearing tmux status for more room
  - https://www.reddit.com/r/neovim/comments/vc75v7/cmdheight0_vimtpipeline_a_match_made_in_heaven/
- color picker, there are two, but one looks a bit more feature rich
  - https://www.reddit.com/r/neovim/comments/vm0w37/introducing_colorpickernvim_a_plugin_that_lets/
- nvim-surround
  - https://www.reddit.com/r/neovim/comments/vot02j/introducing_nvimsurround_a_plugin_for/
- sudo file save when necessary
  - https://www.reddit.com/r/commandline/comments/vqzg5c/dont_you_hate_it_when_you_edit_a_txt_file_in_vi/
- hydra looks dope
  - https://www.reddit.com/r/neovim/comments/w20cl1/hydra_update/
- nice dot files
  - https://www.reddit.com/r/vimporn/comments/whk9no/finally_updated_my_15_years_old_vimscript_config/
- gh tui
  - https://github.com/dlvhdr/gh-dash

# Weird installs

- check docker, neovim, and brew. They can be weird to uninstall and reinstall

# python package installer folder hierarchy

- clean it!
- maybe this is all in a folder at the base?
- good opportunity to learn python development patterns
- Should I specify return types and such?

# rust packages

- fd-find add!:
  - https://github.com/sharkdp/fd
- new top?
  - https://github.com/ClementTsang/bottom
- Rust, should I put locked into command?
- Cargo:
  - https://github.com/ClementTsang/bottom

# config

- change around conf file to have program specific config dirs at the top level
  - With this, update the "dot" class

# How about docker revisit

there is a docker helper install script for development. How about doing this?
Any prod system should have docker manually installed or a custom installer to
fit the prod system's needs, anyways.

# lsp

- Add the following!
- brew install efm-langserver
- efm-langserver config symlink
- Things to checkout, incorporate, etc.

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

## cool tings to checkout

- eyeliner.nvim
- https://github.com/direnv/direnv (cargo env auto load, etc.)
- https://github.com/trivago/prettier-plugin-sort-imports
- https://www.reddit.com/r/neovim/comments/yj9g9l/introducing_portalnvim_a_plugin_like_leap_but_for/
- https://www.reddit.com/r/neovim/comments/y6rlc4/introducing_codewindownvim_a_new_minimap_plugin/
- https://www.reddit.com/r/neovim/comments/y7xhll/introducing_dirtelescopenvim_find_or_grep_in_a/
- https://github.com/kvrohit/mellow.nvim

## react references

- https://www.reddit.com/r/reactjs/comments/y821a5/comment/it1ih4i/?utm_source=share&utm_medium=web2x&context=3
- Zustand for state management
- https://felixgerschau.com/react-component-composition/

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

### submodule init in readme

https://stackoverflow.com/questions/1030169/pull-latest-changes-for-all-git-submodules

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

# if I want typescript references

- https://www.reddit.com/r/neovim/comments/v4mhsv/neovim_setup_for_fullstack_web_development_with/

# good resource

https://github.com/rockerBOO/awesome-neovim

# cargo packages

- https://github.com/nabijaczleweli/cargo-update

# pick through

- [this seems like a good dotfiles to raid](https://github.com/glepnir/nvim)
- [and another one](https://github.com/ayamir/nvimdots)

# breadcrumbs

- https://github.com/rcarriga/dotfiles/blob/master/.config/nvim/init.lua#L46-L66
- Also, this might have a plugin, now

# plugins

- https://github.com/johmsalas/text-case.nvim
- https://github.com/nvim-treesitter/nvim-treesitter-context
- https://github.com/andythigpen/nvim-coverage
- https://github.com/rcarriga/neotest
- https://github.com/ThePrimeagen/refactoring.nvim
- https://github.com/nvim-telescope/telescope-ui-select.nvim
- https://github.com/tami5/xbase
- https://github.com/pwntester/octo.nvim <-- github in neovim
- https://github.com/pwntester/octo.nvim
- https://github.com/ziontee113/syntax-tree-surfer
- alternative to octo: https://who.ldelossa.is/posts/gh-nvim/
- https://github.com/markonm/traces.vim
-
-
-
-
-
-
-

# look in to:

- https://www.reddit.com/r/neovim/comments/xg48k9/what_is_the_coolest_unknownish_plugin_that_youre/
- https://github.com/anuvyklack/windows.nvim
- https://github.com/ziontee113/syntax-tree-surfer
- https://www.reddit.com/r/neovim/comments/q7bgwo/marksnvim_a_plugin_for_viewing_and_interacting/
- https://github.com/chentoast/marks.nvim
- https://github.com/uga-rosa/ccc.nvim
- look into code folding more, not sure how to do it the native way.
- https://github.com/ray-x/lsp_signature.nvim
- https://github.com/EdenEast/nightfox.nvim
- https://github.com/savq/melange
- https://github.com/sainnhe/sonokai
- https://github.com/sainnhe/everforest
- https://github.com/folke/tokyonight.nvim
- https://github.com/catppuccin/catppuccin
- https://github.com/sam4llis/nvim-tundra
- https://alpha2phi.medium.com/neovim-for-beginners-lsp-using-null-ls-nvim-bd954bf86b40
- https://www.reddit.com/r/neovim/comments/x409tv/cant_go_back_to_vscode/
- https://www.reddit.com/r/neovim/comments/x53lzx/i_must_be_missing_something/
- https://www.reddit.com/r/neovim/comments/x3zp6t/usage_of_afterftplugin_directory_for/
- https://github.com/phaazon/mind.nvim
- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md
- https://www.reddit.com/r/neovim/comments/wym9fi/regex_nvim_plugin/
- https://www.reddit.com/r/neovim/comments/vm0w37/introducing_colorpickernvim_a_plugin_that_lets/
-

## mac things

- https://github.com/rxhanson/Rectangle

### pyenv global?

```
pyenv global 3.8.13 2.7.18
```

# add a default configurations for things

### sqlfluff

https://docs.sqlfluff.com/en/stable/configuration.html#default-configuration

```
[sqlfluff]

# verbose is an integer (0-2) indicating the level of log output
verbose = 0

# Turn off color formatting of output
nocolor = False

# Supported dialects https://docs.sqlfluff.com/en/stable/dialects.html
# Or run 'sqlfluff dialects'
dialect = bigquery

# One of [raw|jinja|python|placeholder]
templater = jinja

# Comma separated list of rules to check, default to all
rules = all

# Comma separated list of rules to exclude, or None
exclude_rules = None

# The depth to recursively parse to (0 for unlimited)
recurse = 0

# Below controls SQLFluff output, see max_line_length for SQL output
output_line_length = 80

# Number of passes to run before admitting defeat
runaway_limit = 10

# Ignore errors by category (one or more of the following, separated by commas: lexing,linting,parsing,templating)
ignore = templating
# ignore = None

# Ignore linting errors found within sections of code coming directly from
# templated code (e.g. from within Jinja curly braces. Note that it does not
# ignore errors from literal code found within template loops.
ignore_templated_areas = True

# can either be autodetect or a valid encoding e.g. utf-8, utf-8-sig
encoding = autodetect

# Ignore inline overrides (e.g. to test if still required)
disable_noqa = False

# Comma separated list of file extensions to lint
# NB: This config will only apply in the root folder
sql_file_exts = .sql,.sql.j2,.dml,.ddl

# Allow fix to run on files, even if they contain parsing errors
# Note altering this is NOT RECOMMENDED as can corrupt SQL
# fix_even_unparsable = True
fix_even_unparsable = False # default

# Very large files can make the parser effectively hang.
# This limit skips files over a certain character length
# and warns the user what has happened.
# Set this to 0 to disable.
large_file_skip_char_limit = 20000

# CPU processes to use while linting.
# If positive, just implies number of processes.
# If negative or zero, implies number_of_cpus - specifed_number.
# e.g. -1 means use all processors but one. 0  means all cpus.
processes = 0
```

### quickscope colors

- https://github.com/unblevable/quick-scope#customize-colors

### tmux plugins

```fish
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'egel/tmux-gruvbox'
set -g @plugin 'laktak/extrakto'
set -g @plugin 'tmux-plugins/tmux-yank'
```

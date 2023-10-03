# .dot

configuration files for dotfiles and configuration files I use across machines

## clone

```fish
git clone --recursive git@github.com:radiomime/.dot.git
```

# package (re)installation

## vital packages

### [homebrew](https://brew.sh/)

Go to the link above and install it

```sh
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### [kitty](https://sw.kovidgoyal.net/kitty/binary/#binary-install)

```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

_Note: the above command also will update kitty_

### [fish](https://fishshell.com/)

Update shell to fish

```sh
# add to /etc/shells. May need to echo the string, and add via tee
which fish | xargs tee -a /etc/shells

which fish | xargs chsh -s
```

### stow

#### mac

```sh
brew install stow
```

#### linux

```sh
apt install stow
```

### rust and cargo packages

- [install rust](https://www.rust-lang.org/tools/install) using the linked script

<details>
    <summary>uninstall</summary>

    ```sh
    rustup self uninstall
    ```

</details>

#### cargo packages

```fish
cargo install \
  bandwhich \
  bat \
  bottom \
  exa \
  fd-find \
  ripgrep \
  rm-improved \
  rnr \
  stylua \
  tree-sitter-cli \
  watchexec-cli

# other possible cool ones
# diskonaut from https://github.com/imsnif/diskonaut
# du-dust from https://github.com/bootandy/dust
# broot from https://github.com/Canop/broot

switch (uname)
  case Linux
    echo linux cargo package setup
    sudo setcap cap_sys_ptrace,cap_dac_read_search,cap_net_raw,cap_net_admin+ep (which bandwhich)
  case Darwin
    echo osx cargo package setup
  case '*'
    echo no setup defined for os
end
```

## different install by machine

### nerdfonts

```
git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git ~/.local/share/nerd-fonts
./install
```

### [docker](https://www.docker.com/)

- Install over the web or use the convenience script at: https://get.docker.com

### mac

```sh
brew install \
    neovim \
    go
```

For newer neovim...

```sh
brew install neovim \ # [--HEAD]
```

## cross platform

### python package management

#### [conda](https://docs.conda.io/projects/miniconda/en/latest/#quick-command-line-install)

### TODO: slightly refactoring below this point

## pyenv install

[Follow instructions here.](https://github.com/pyenv/pyenv)

_pyenv seems useful, but I'm not sold yet._

### fish shell in linux

```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
cd ~/.pyenv && src/configure && make -C src && \
set -Ux PYENV_ROOT $HOME/.pyenv && \
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
```

## install packages overkill factory

```
python -m pip install requests distro
./packages/install.py -l | xargs ./packages/install.py -i
```

## starship

### macos

```sh
brew install starship
```

### linux

```sh
curl -sS https://starship.rs/install.sh | sh
```

## link dotfiles with stow

```fish
# .config cannot be dot-config until this issue resolves
#     https://github.com/aspiers/stow/issues/33

stow -v \
  --dotfiles \
  --restow   \
  bash       \
  fish       \
  git        \
  kitty      \
  nvim       \
  starship   \
  tmux       \
  hammerspoon
```

## install docker

note: for mac.

- [install docker](https://docs.docker.com/desktop/mac/install/)

# MacOS Specific

## Keyboard Shortcuts

- I change mission control --> 'move left/right a space' shortcuts to line up with
  PopOS

<details>
  <summary>keyboard shortcut overwrites</summary>

I found these to conflict with MacOS built-ins a little too much for my comfort.

- @ : command
- $ : shift
- ~ : alt
- ^ : ctr

```sh
defaults read -g                NSUserKeyEquivalents
defaults read com.brave.Browser NSUserKeyEquivalents
```

```sh
# defaults
defaults write -g NSUserKeyEquivalents -dict-add "Copy" -string "^c"
defaults write -g NSUserKeyEquivalents -dict-add "Paste" -string "^v"

# brave
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "New Tab"           -string "^t"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "New Window"        -string "^n"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Close Tab"         -string "^w"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Reopen Closed Tab" -string "^\$t"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Open Location..."  -string "^l"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Reload This Page"  -string "^r"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Find..."           -string "^f"
```

</details>

# node installation

<details>
  <summary>Using nvm.fish for node</summary>

```fish
fisher install jorgebucaran/nvm.fish
# stable (needed for copilot)
nvm install lts
set --universal nvm_default_version lts

# latest npm/node
nvm install latest
set --universal nvm_default_version latest
```

- I found another good resource if nvm.fish ends up sucking. It's [fnm, the blazing fast way](https://github.com/Schniz/fnm)

</details>

# troubleshooting

<details>
  <summary>Blow up packer</summary>

```
printf "*** packer base dir ***\n"
ls ~/.local/share/nvim/site/pack/packer
printf "*** packer opt dir ***\n"
ls ~/.local/share/nvim/site/pack/packer/opt
printf "*** packer start dir ***\n"
ls ~/.local/share/nvim/site/pack/packer/start
```

Are all your plugins there? If so,

```
rip ~/.local/share/nvim/site/pack/packer
nvim --headless -c 'exit'
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

</details>

# misc installs

<details>
    <summary>linux</summary>

    ```sh
    sudo apt install ctop
    ```

</details>

<details>
    <summary>mac</summary>

    ```sh
    brew install ctop
    ```

</details>

# thanks

- [neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) and its creator [Chris](https://github.com/ChristianChiarulli) made using neovim so much easier. Many thanks.
- I was inspired from [Lukas's dotfiles](https://github.com/lukas-reineke?tab=repositories) as well.
- thanks to my friend [Ethan](https://github.com/EthanJWright) for getting me started with vim.
- [this repo](https://github.com/ashfinal/awesome-hammerspoon) was my base for my hammerspoon config.

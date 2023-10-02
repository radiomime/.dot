# .dot

configuration files for dotfiles and configuration files I use across machines

## clone

```fish
git clone --recursive git@github.com:radiomime/.dot.git
```

# package (re)installation

## [homebrew](https://brew.sh/)

Go to the link above and install it

## [kitty](https://sw.kovidgoyal.net/kitty/binary/#binary-install)

### mac

[Use brew to install](https://formulae.brew.sh/cask/kitty)

```sh
brew install --cask kitty
```

### linux

```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

_Note: the above command also will update kitty_

## cross platform

### [fish](https://fishshell.com/)

### rust and cargo packages

#### [rust](https://www.rust-lang.org/tools/install)

```sh
curl \
    --proto '=https' \
    --tlsv1.2 \
    -sSf \
    https://sh.rustup.rs | sh
```

<details>
    <summary>uninstall</summary>

    ```sh
    rustup self uninstall
    ```

</details>

#### cargo packages

```fish
cargo install \
  ripgrep \
  bandwhich \
  watchexec-cli \
  exa \
  rm-improved \
  stylua \
  fd-find \
  bottom \
  rnr \
  bat \
  tree-sitter-cli

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

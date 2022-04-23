# .dot

Repo for dotfiles.

# install

## pyenv install

[Follow instructions here.](https://github.com/pyenv/pyenv)

### fish shell in linux

```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
cd ~/.pyenv && src/configure && make -C src && \
set -Ux PYENV_ROOT $HOME/.pyenv && \
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
```

## install packages overkill factory

```
python3 -m pip install requests distro
./packages/install.py -l | xargs ./packages/install.py -i
```

## link dotfiles with stow

```bash
# .config cannot be dot-config until this issue resolves
#     https://github.com/aspiers/stow/issues/33

stow -v --dotfiles bash fish git kitty nvim starship tmux hammerspoon
```

## install cargo packages

```sh
cargo install ripgrep bandwhich watchexec-cli exa rm-improved stylua fd-find

switch (uname)
  case Linux
    echo linux cargo package setup
    sudo setcap cap_sys_ptrace,cap_dac_read_search,cap_net_raw,cap_net_admin+ep (which bandwhich)
  case Darwin
    echo osx cargo package setup
  case '*'
    echo unexpected os
end
```

## install docker

NOTE: Only necessary on Mac.

- [install docker](https://docs.docker.com/desktop/mac/install/)

# reinstall

```
# reinstall
stow -v --dotfiles --restow bash fish git kitty nvim starship tmux
```

# uninstall

```
# uninstall
stow -v --dotfiles --delete bash fish git kitty nvim starship tmux
```

# MacOS Specific

## Keyboard Shortcuts

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
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "New Tab"          -string "^t"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "New Window"       -string "^n"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Close Tab"        -string "^w"
defaults write com.brave.Browser NSUserKeyEquivalents -dict-add "Open Location..." -string "^l"
```

I also change mission control --> 'move left/right a space' shortcuts to line up with
PopOS, but that is weird on the command line for what I can tell

# thanks

[Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) and its
creator [Chris](https://github.com/ChristianChiarulli) made using neovim so
much easier. Many thanks. I got inspired from [these
dotfiles](https://github.com/lukas-reineke?tab=repositories) as well. And
thanks to my friend [Ethan](https://github.com/EthanJWright) for getting me
started with vim.

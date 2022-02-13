# .dot

Repo for dotfiles.

# install

## install packages overkill factory

```
./packages/install.py
```

## link dotfiles with stow

```bash
# .config cannot be dot-config until this issue resolves
#     https://github.com/aspiers/stow/issues/33

stow -v --dotfiles bash fish git kitty nvim starship tmux
```

## install cargo packages

```sh
cargo install ripgrep bandwhich watchexec-cli exa rm-improved

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

# for languages

```
:TSInstall <language>
:LspInstall <language>
```

# mac todo

check m1 install compatability

oritginal etc shells

```sh
matthewwright@mattbook packages % cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/dash
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

# mac

- [install docker](https://docs.docker.com/desktop/mac/install/)

# thanks

[Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) and its
creator [Chris](https://github.com/ChristianChiarulli) made using neovim so
much easier. Many thanks. I got inspired from [these
dotfiles](https://github.com/lukas-reineke?tab=repositories) as well. And
thanks to my friend [Ethan](https://github.com/EthanJWright) for getting me
started with vim.

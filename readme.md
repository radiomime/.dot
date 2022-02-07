# .dot

Repo for dotfiles.

# install

## link dotfiles with stow

```bash
# .config cannot be dot-config until this issue resolves
#     https://github.com/aspiers/stow/issues/33
stow -v --dotfiles bash fish git kitty nvim starship tmux
```

## install programs

todo: install process

# uninstall

```
# reinstall
stow -v --dotfiles --restow bash fish git kitty nvim starship tmux

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

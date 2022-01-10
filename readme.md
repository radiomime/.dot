# .dot

Repo for dotfiles.

# install

```bash
# .config cannot be dot-config until this issue resolves
#     https://github.com/aspiers/stow/issues/33
stow -v --dotfiles bash fish git kitty nvim starship tmux
```

`./install.py` should do the trick.

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

# thanks

[Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) and its
creator [Chris](https://github.com/ChristianChiarulli) made using neovim so
much easier. Many thanks. I got inspired from [these
dotfiles](https://github.com/lukas-reineke?tab=repositories) as well. And
thanks to my friend [Ethan](https://github.com/EthanJWright) for getting me
started with vim.

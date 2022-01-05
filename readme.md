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

* Many thanks to [Ethan Wright](https://github.com/EthanJWright) for vim
insights, the original dotfiles, and inspiration to get off the ides.
* init.vim generation via `vim-bootstrap`

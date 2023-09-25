# setting up into pihole

### install fish

```fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```

### install rust

[from instructions here](https://www.rust-lang.org/tools/install)

### install cargo packages

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
  tree-sitter-cli
```

### get docker

Use either [the convenience scripts here](https://github.com/docker/docker-install) or [install for your OS here](https://docs.docker.com/engine/install/)

### get neovim

```
./packages/install.py -i neovim
```

#### [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)

```
sudo apt-get install ninja-build gettext cmake unzip curl
```

#### install

```fish
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

```

#!/usr/bin/env python3
import subprocess
from os.path import abspath, expanduser

from .abs_package import Package

# from .util import github_release_metadata, is_installed


class Dot(Package):
    def __init__(self, config_dir=abspath(expanduser("~/.config/nvim"))):
        super().__init__()
        self.config_dir = config_dir

        # directories which need to exist
        self.dirs = [self.config_dir + "/undodir"]

        # dotfiles to link
        self.files = {
            # neovim files
            "./conf/init.vim": self.config_dir + "/init.vim",
            "./conf/plugin": self.config_dir + "/plugin",
            # git
            "./conf/gitconfig": "~/.gitconfig",
            # fish
            "./conf/config.fish": "~/.config/fish/config.fish",
            "./conf/fish_functions": "~/.config/fish/functions",
            "./conf/fish_plugins": "~/.config/fish/fish_plugins",
            "./conf/starship.toml": "~/.config/starship.toml",
            # bash
            "./conf/bashrc": "~/.bashrc",
            "./conf/public_aliases": "~/.public_aliases",
            # tmux
            "./conf/tmux.conf": "~/.tmux.conf",
            # kitty
            "./conf/kitty.conf": "~/.config/kitty/kitty.conf",
            # various
            "./conf/fzf_functions": "~/.fzf_functions",
            "./conf/functions": "~/.functions",
        }

    def is_installed(self):
        return False

    def get_version(self):
        return None

    def __install(self):
        print("symlinking dotfiles")
        self.__create_dirs()
        self.__create_symlinks()

    def __uninstall(self):
        print("symlinking dotfiles")
        self.__remove_symlinks()

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_install(self):
        self.__install()

    def osx_uninstall(self):
        self.__uninstall()

    def __symlink(self, src, lnk):
        subprocess.run(["ln", "-sfn", src, lnk])

    def __mkdir(self, directory):
        subprocess.run(["mkdir", "-p", directory])

    def __create_dirs(self):
        for d in self.dirs:
            self.__mkdir(d)

    def __create_symlinks(self):
        for src, dst in self.files.items():
            self.__symlink(abspath(expanduser(src)), abspath(expanduser(dst)))

    def __remove_symlinks(self):
        for src, dst in self.files.items():
            print("removing symlink at", abspath(expanduser(dst)))
            subprocess.run(["rm", abspath(expanduser(dst))])

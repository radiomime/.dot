#!/usr/bin/env python3
from sys import platform

import sys
from os.path import expanduser
from os.path import abspath
import time
import subprocess
import os

from lib.util import (
    getSys,
)

class Dot:
    def __init__(self, configDir=abspath(expanduser('~/.config/nvim'))):
        self.configDir = configDir
        self.os        = getSys()

        # directories which need to exist
        self.dirs = [
            self.configDir + "/undodir"
        ]

        # dotfiles to link
        self.files  = {
            # neovim files
            './conf/init.vim': self.configDir + "/init.vim",
            './conf/plugin': self.configDir + "/plugin",

            # git
            './conf/gitconfig': '~/.gitconfig',

            # bash
            './conf/bashrc': '~/.bashrc',
            './conf/public_aliases': '~/.public_aliases',

            # tmux
            './conf/tmux.conf': '~/.tmux.conf',

            # various
            './conf/fzf_functions': '~/.fzf_functions',
            './conf/functions': '~/.functions',
            # self.configDir = abspath(expanduser('~/.config/nvim'))
            # abspath('./conf/generate.vim'): self.configDir + "/generate.vim",
            # "../conf/vim_colors": "~/.vim/colors",
            # "../conf/skeletons": "~/.vim/skeletons",
            # "../conf/fzf_functions": "~/.fzf_functions",
            # "../conf/vimrc_full": "~/.vimrc",
        }


    def install(self):
        if self.os == 'linux' or self.os == 'osx':
            print('symlinking dotfiles')
            self.__createDirs()
            self.__createSymlinks()
        else:
            print('no install instructions for', self.os)
            return

    def uninstall(self):
        if self.os == 'linux' or self.os == 'osx':
            print('symlinking dotfiles')
            self.__removeSymlinks()
        else:
            print('no install instructions for', self.os)
            return

    def __symlink(self, src, lnk):
        subprocess.run(['ln', '-sfn', src, lnk])

    def __mkdir(self, directory):
        subprocess.run(['mkdir', '-p', directory])

    def __createDirs(self):
        for d in self.dirs:
            self.__mkdir(d)


    def __createSymlinks(self):
        for src, dst in self.files.items():
            self.__symlink(
                abspath(expanduser(src)),
                abspath(expanduser(dst))
            )

    def __removeSymlinks(self):
        for src, dst in self.files.items():
            print('removing symlink at', abspath(expanduser(dst)))
            subprocess.run(['rm', abspath(expanduser(dst))])

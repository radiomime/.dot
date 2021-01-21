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

        self.files  = {
            './conf/init.vim': self.configDir + "/init.vim",
            './conf/gitconfig': '~/.gitconfig',
            './conf/bashrc': '~/.bashrc',
            './conf/bashrc': '~/.bashrc',
            './conf/public_aliases': '~/.public_aliases',
            './conf/tmux.conf': '~/.tmux.conf',
            './conf/fzf_functions': '~/.fzf_functions',
            './conf/functions': '~/.functions',
            # self.configDir = abspath(expanduser('~/.config/nvim'))
            # abspath('./conf/generate.vim'): self.configDir + "/generate.vim",
            # "../conf/vim_colors": "~/.vim/colors",
            # "../conf/skeletons": "~/.vim/skeletons",
            # "../conf/fzf_functions": "~/.fzf_functions",
            # "../conf/vimrc_full": "~/.vimrc",
            # "../conf/gitconfig": "~/.gitconfig",
        }

    def __symlink(self, src, lnk):
        subprocess.run(['ln', '-sfn', src, lnk])

    def __createSymlinks(self):
        for src, dst in self.files.items():
            self.__symlink(
                abspath(expanduser(src)),
                abspath(expanduser(dst))
            )

    def install(self):
        if self.os == 'linux' or self.os == 'osx':
            print('symlinking dotfiles')
            self.__createSymlinks()
        else:
            print('no install instructions for', self.os)
            return


    def removeSymlinks(self):
        for src, dst in self.files.items():
            print('removing symlink at', abspath(expanduser(dst)))
            subprocess.run(['rm', abspath(expanduser(dst))])

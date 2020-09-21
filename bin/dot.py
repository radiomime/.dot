#!/usr/bin/env python3
from sys import platform

import sys
from os.path import expanduser
from os.path import abspath
import time
import subprocess
import os

class Dotfiles:
    def __init__(self, configDir=abspath(expanduser('~/.config/nvim'))):
        self.configDir = configDir
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

    def symlink(self, src, lnk):
        print('Linking:', lnk, 'to\n\t', src)
        subprocess.run(['ln', '-sfn', src, lnk])

    def createSymlinks(self):
        for src, dst in self.files.items():
            self.symlink(abspath(expanduser(src)), abspath(expanduser(dst)))

    def removeSymlinks(self):
        for src, dst in self.files.items():
            print('removing symlink at', abspath(expanduser(dst)))
            subprocess.run(['rm', abspath(expanduser(dst))])

class Neovim:
    def __init__(self, system='unknown'):
        self.system  = system
        self.path    =  abspath(expanduser('.'))
        self.installPath = '/tmp/dot-neovim-' + str(time.time_ns())
        self.configDir = abspath(expanduser('~/.config/nvim'))
        # print('system:', self.system)
        # print('path:', self.path)
        # print('installPath:', self.installPath)

    def getConfigDir(self):
        return self.configDir

    def checkInstall(self):
        from shutil import which
        return which('nvim') is not None

    def installRequirements(self):
        if self.system == 'linux':
            print('Installing neovim dependencies')
            subprocess.run(['sudo', 'apt-get', '-qq' ,'install',
                            'ninja-build',
                            'gettext',
                            'libtool',
                            'libtool-bin',
                            'autoconf',
                            'automake',
                            'cmake',
                            'g++',
                            'pkg-config',
                            'unzip'])

        elif self.system == 'osx':
            print('Untested: Running with OSX')
            subprocess.run(['sudo', 'brew', 'install',
                            'ninja',
                            'libtool',
                            'automake',
                            'cmake',
                            'pkg-config',
                            'gettext'])

    def createConfigDir(self):
        print('Config for nvim at:', self.configDir)
        subprocess.run(['mkdir', '-p', self.configDir])

    def providers(self):
        print('installing providers')

        subprocess.run(['python3',
                        '-m',
                        'pip',
                        'install',
                        '--user',
                        '--upgrade',
                        'pynvim'])

    def install(self):
        # Research, should I be on the stable branch? `git checkout stable`
        print('Cloning neovim directory')
        subprocess.run(['git', 'clone',
                        'https://github.com/neovim/neovim', self.installPath])
        print('Making neovim')
        subprocess.run(['make',
                        '--directory', self.installPath,
                        'CMAKE_BUILD_TYPE=Release'])
        print('Installing neovim')
        subprocess.run(['sudo', 'make', '--directory', self.installPath, 'install'])

    def uninstall(self):
        print('Uninstalling nvim binary')
        subprocess.run(['sudo', 'rm', '/usr/local/bin/nvim'])
        print('Uninstalling nvim local share')
        subprocess.run(['sudo', 'rm', '-rf', '/usr/local/share/nvim'])



def main(argv):
    print('module for dotfiles')

if __name__ == "__main__":
    main(sys.argv)

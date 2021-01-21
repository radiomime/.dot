#!/usr/bin/env python3
from sys import platform

import sys
from os.path import expanduser
from os.path import abspath
import time
import subprocess
import os

from .apt import Apt
from lib.util import (
    getSys,
    pkgInstalled
)
# neo = dot.Neovim(util.getSys())
# neo = dot.Neovim()
# neo.createConfigDir()
# if not neo.checkInstall():
#     print('Installing neovim')
#     neo.installRequirements()
#     neo.install()
#     # neo.createConfigDir()
# else:
#     print('Neovim is already installed')
    # def checkInstall(self):
    #     from shutil import which
    #     return which('nvim') is not None

class Neovim:
    def __init__(self):
        self.os          = getSys()
        self.path        =  abspath(expanduser('.'))
        self.installPath = '/tmp/dot-neovim-' + str(time.time_ns())

        self.configDir   = None
        if (self.os == 'osx' or self.os == 'linux'):
            self.configDir   = abspath(expanduser('~/.config/nvim'))

    def install(self):
        if pkgInstalled('nvim'):
            print('Neovim is already installed')
            return

        if self.os == 'linux':
            print('I should, but am not, installing neovim for linux')
            # self.linuxInstall()
        elif self.os == 'osx':
            print('todo: creating install instructions for', self.os)
        else:
            print('no install instructions for', self.os)
            return

        self.getPip()
        self.getProviders()

    def linuxInstall(self):
        print('Installing neovim dependencies')
        Apt().update().install([
            'ninja-build',
            'gettext',
            'libtool',
            'libtool-bin',
            'autoconf',
            'automake',
            'cmake',
            'g++',
            'pkg-config',
            'unzip',
        ])

        print('Cloning neovim directory')
        subprocess.run([
            'git',
            'clone',
            'https://github.com/neovim/neovim',
            self.installPath,
        ])

        print('Making neovim')
        subprocess.run([
            'make',
            '--directory',
            self.installPath,
            'CMAKE_BUILD_TYPE=Release',
        ])

        print('Installing neovim')
        subprocess.run([
            'sudo',
            'make',
            '--directory',
            self.installPath,
            'install',
        ])

    def linuxUninstall(self):
        print('Uninstalling nvim binary')
        subprocess.run([
            'sudo',
            'rm',
            '/usr/local/bin/nvim',
        ])

        print('Uninstalling nvim local share')
        subprocess.run([
            'sudo',
            'rm',
            '-rf',
            '/usr/local/share/nvim',
        ])

    def uninstall(self):
        if self.os == 'linux':
            self.linuxUninstall()
        elif self.os == 'osx':
            print('NO UNINSTALL DIRECTIONS FOR: ', self.os)
        else:
            print('no install instructions for', self.os)
            return


    def getConfigDir(self):
        return self.configDir

    def createConfigDir(self):
        print('Config for nvim at:', self.configDir)
        subprocess.run(['mkdir', '-p', self.configDir])

    def getPip(self):
        print('installing providers')
        subprocess.run(['sudo',
                        'apt',
                        'install',
                        '-y',
                        'python3-pip',
                        ])

    def getProviders(self):
        print('installing providers')
        subprocess.run(['python3',
                        '-m',
                        'pip',
                        'install',
                        '--user',
                        '--upgrade',
                        'pynvim'])




def main(argv):
    print('module for dotfiles')

if __name__ == "__main__":
    main(sys.argv)

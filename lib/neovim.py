#!/usr/bin/env python3
from sys import platform

import sys
from os.path import expanduser
from os.path import abspath
import time
import subprocess
import os

from .apt import Apt
from .brew import Brew
from lib.util import (
    getSys,
    pkgInstalled
)

class Neovim:
    def __init__(self):
        self.os          = getSys()
        self.path        =  abspath(expanduser('.'))
        self.installPath = '/tmp/dot-neovim-' + str(time.time_ns())

        if (self.os == 'osx' or self.os == 'linux'):
            configDir = abspath(expanduser('~/.config/nvim'))

            print('Config for nvim at:', configDir)
            subprocess.run(['mkdir', '-p', configDir])

    def install(self):
        if pkgInstalled('nvim'):
            print('Neovim is already installed')
            return

        if self.os == 'linux':
            self.__linuxInstall()
        elif self.os == 'osx':
            self.__osxInstall()
        else:
            print('no install instructions for', self.os)
            return

        if pkgInstalled('nvim'):
            print('Installing providers for neovim')
            self.__getProviders()


    def __linuxInstall(self):
        print('Installing neovim dependencies')
        apt = Apt()

        apt.update()
        apt.install([
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

        print('Installing pip')
        apt.install('python3-pip')

    def __linuxUninstall(self):
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

    def __osxInstall(self):
        print('installing neovim for osx')
        brew = Brew()
        brew.update()
        # brew.install('neovim')
        brew.install([
            'ninja',
            'libtool',
            'automake',
            'cmake',
            'pkg-config',
            'gettext',
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

    def __osxUninstall(self):
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
            self.__linuxUninstall()
        elif self.os == 'osx':
            self.__osxUninstall()
        else:
            print('no install instructions for', self.os)
            return


    def __getProviders(self):
        print('installing providers')
        subprocess.run(['python3',
                        '-m',
                        'pip',
                        'install',
                        '--user',
                        '--upgrade',
                        'pynvim'])

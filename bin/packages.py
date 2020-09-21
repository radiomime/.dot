#!/usr/bin/env python3
from sys import platform

import sys
from os.path import expanduser
from os.path import abspath
from shutil import which
import time
import subprocess
import os

from .util import *

class Poetry:
    def __init__(self):
        print('*** performing actions for Poetry package')
        if which('python3') is not None:
            self.pyInterpreter = 'python3'
        elif which('python') is not None:
            self.pyInterpreter = 'python'
        else:
            print('Expected python to be installed!')
            self.pyInterpreter = None

        subprocess.run(['curl',
                        '-sSL',
                        'https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py',
                        '-o', 'get-poetry.py'])
        self.os = getSys()

    def checkInstall(self):
        return which('poetry') is not None

    def install(self):
        if not self.checkInstall():
            subprocess.run([self.pyInterpreter,
                            'get-poetry.py'])
            subprocess.run(['poetry', '--version'])
        self.update()

    def update(self):
        if self.checkInstall():
            subprocess.run(['poetry', 'self', 'update'])

    def uninstall(self):
        if self.checkInstall():
            subprocess.run([self.pyInterpreter,
                            'get-poetry.py',
                            '--uninstall'])

    def __del__(self):
        subprocess.run(['rm',
                        'get-poetry.py'])

class Packages:
    def __init__(self):
        self.os = getSys()

    def uu(self):
        print('updating and upgrading packages')
        subprocess.run(['sudo', 'apt', 'update', '-y'])

    def install(self):
        print('not updating and upgrading packages')
        # self.uu();

        Poetry().install()

    def uninstall(self):
        Poetry().uninstall()

def main(argv):
    print('module for packages')

if __name__ == "__main__":
    main(sys.argv)

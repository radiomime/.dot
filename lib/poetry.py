#!/usr/bin/env python3
from sys import platform
import json
import sys
from shutil import which
import time
import subprocess
import os

from .apt import Apt
from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo,
)

class Poetry:
    def __init__(self):
        print('*** performing actions for Poetry package')

        self.pyInterpreter = getPyInterpreter()
        subprocess.run([
            'curl',
            '-sSL',
            ''.join([
                'https://raw.githubusercontent.com/',
                'python-poetry/poetry/master/get-poetry.py',
            ]),
            '-o', 'get-poetry.py'])
        self.os = getSys()

    def checkInstall(self):
        return which('poetry') is not None

    def install(self):
        if self.os == 'linux':
            self.__linuxInstall()
        else:
            print('no install instructions for', self.os)

    def __linuxInstall(self):
        # apt dependencies
        apt = Apt()
        apt.install('python3-venv')

        if not self.checkInstall():
            subprocess.run([self.pyInterpreter,
                            'get-poetry.py', '-y'])
            subprocess.run(['sh',
                            '.', '~/.poetry/env'])
            subprocess.run(['poetry', '--version'])

        self.update()


    def update(self):
        if self.checkInstall():
            subprocess.run(['poetry', 'self', 'update'])

    def uninstall(self):
        if self.checkInstall():
            subprocess.run([
                self.pyInterpreter,
                'get-poetry.py',
                '--uninstall',
            ])

    def __del__(self):
        subprocess.run([
            'rm',
            'get-poetry.py',
        ])

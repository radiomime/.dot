#!/usr/bin/env python3
from sys import platform
import json
import sys
from os.path import expanduser
from os.path import abspath
from shutil import which
import time
import subprocess
import os
import requests
import getpass

from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo,
)

class Poetry:
    def __init__(self):
        print('*** performing actions for Poetry package')

        self.pyInterpreter = getPyInterpreter()


        subprocess.run(['curl',
                        '-sSL',
                        'https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py',
                        '-o', 'get-poetry.py'])
        self.os = getSys()

    def aptDependencies(self):
        #TODO: add this? Should this be here?
        subprocess.run(['sudo',
                        'apt',
                        'install',
                        'python3-venv'])

    def checkInstall(self):
        return which('poetry') is not None

    def install(self):
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
            subprocess.run([self.pyInterpreter,
                            'get-poetry.py',
                            '--uninstall'])

    def __del__(self):
        subprocess.run(['rm',
                        'get-poetry.py'])

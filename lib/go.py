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

class Go:
    def __init__(self):
        print('*** performing actions for Go package')
        self.os = getSys()

    def checkInstall(self):
        return which('go') is not None

    def install(self):
        if not self.checkInstall():
            subprocess.run(['sudo',
                            'snap',
                            'install',
                            'go',
                            '--classic'
                            ])
            subprocess.run(['go', 'version'])
        self.update()

    def update(self):
        if self.checkInstall():
            subprocess.run(['sudo', 'snap', 'refresh', 'go'])

    def uninstall(self):
        if self.checkInstall():
            subprocess.run(['sudo',
                            'snap',
                            'remove',
                            'go'])

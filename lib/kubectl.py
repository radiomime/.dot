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
import platform
import distro

from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo,
)

from .apt import Apt

class Kubectl:
    def __init__(self):
        print('*** installing kubectl')
        self.os = getSys()
        self.user = getpass.getuser()
        self.path = '/usr/local/bin'

    def install(self):
        if self.os == 'linux':
            self.__linuxInstall()
        else:
            print('no install instructions for', self.os)

    def uninstall(self):
        if self.os == 'linux':
            print('no uninstall instructions for', self.os)
        else:
            print('no uninstall instructions for', self.os)

    def __linuxInstall(self):
        latestRelease = requests.get(
            "".join([
                'https://storage.googleapis.com/',
                'kubernetes-release/release/stable.txt',
        ])).text

        binaryLoc = "".join([
            'https://storage.googleapis.com/',
            'kubernetes-release/release/',
            latestRelease,
            '/bin/linux/amd64/kubectl',
        ])

        subprocess.run([
            'sudo',
            'curl',
            '-fsSL',
            binaryLoc,
            '-o',
            "".join([self.path + '/' + 'kubectl']),
        ])

        subprocess.run([
            'sudo',
            'chmod',
            '+x',
            "".join([self.path + '/' + 'kubectl']),
        ])


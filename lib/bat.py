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

#
# TODO: mac install
# TODO: uninstall
# TODO: mac uninstall
#
class Bat:
    def __init__(self):
        self.os = getSys()
        self.user = getpass.getuser()
        self.path = '/usr/local/bin'


    def install(self):
        print('*** installing bat')
        if self.os == 'linux':
            self.linuxInstall()
        else:
            print('no install instructions for', self.os)

    def uninstall(self):
        if self.os == 'linux':
            print('no uninstall instructions for', self.os)
        else:
            print('no uninstall instructions for', self.os)

    def linuxInstall(self):
        batVersion = getLatestGithubRepo('sharkdp/bat')['name']

        repo = "".join([
            'https://github.com/sharkdp/bat/releases/download/',
            batVersion, '/',
            'bat_',
            batVersion[1:],
            '_amd64.deb'
        ])

        subprocess.run([
            # 'sudo',
            'curl',
            '-fsSL',
            repo,
            '-o',
            "".join('bat_amd64.deb'),
        ])

        subprocess.run([
            'sudo',
            'dpkg',
            '-i',
            'bat_amd64.deb',
        ])

        subprocess.run([
            'rm',
            'bat_amd64.deb',
        ])

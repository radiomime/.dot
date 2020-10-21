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
class Minikube:
    def __init__(self):
        print('*** minikube')
        self.os = getSys()
        # self.user = getpass.getuser()
        # self.path = '/usr/local/bin'

        subprocess.run([
            'curl',
            '-sSL',
            ''.join([
                'https://storage.googleapis.com/',
                'minikube/releases/latest/',
                'minikube_latest_amd64.deb',
            ]),
            '-o', 'minikube_latest_amd64.deb'
        ])

    def __del__(self):
        subprocess.run(['rm',
                        'minikube_latest_amd64.deb'])

    def linuxInstall(self):
        subprocess.run([
            'sudo',
            'dpkg',
            '-i',
            'minikube_latest_amd64.deb'
        ])

    def install(self):
        if self.os == 'linux':
            self.linuxInstall()
        else:
            print('no install instructions for', self.os)

    def uninstall(self):
        if self.os == 'linux':
            print('no uninstall instructions for', self.os)
        else:
            print('no uninstall instructions for', self.os)

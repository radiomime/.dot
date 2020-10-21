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
)

class Apt:
    def __init__(self):
        self.os = getSys()
        self.user = getpass.getuser()

    def update(self):
        subprocess.run([
            'sudo',
            'apt-get',
            '-qq',
            'update',
        ])

    def install(self, pkg):
        print('installing', pkg)

        subprocess.run([
            'sudo',
            'apt-get',
            '-qq',
            'install',
            '-y',
            pkg,
        ], stdout=open(os.devnull, 'wb'))


    def uninstall(self, pkg):
        print('uninstalling', pkg)

    def addGpgKey(self, link):
        # 'https://download.docker.com/linux/debian/gpg',
        print('adding gpg key from:', link)
        subprocess.run([
            'curl',
            '-fsSL',
            link,
            '-o', 'gpg-key-to-add'
        ])

        subprocess.run([
            'sudo',
            'apt-key',
            'add',
            'gpg-key-to-add'
        ])

        subprocess.run([
            'rm',
            'gpg-key-to-add'
        ])

    def gpgFingerprint(self, last8):
        subprocess.run([
            'sudo',
            'apt-key',
            'fingerprint',
            last8,
        ])

    def addAptRepo(self, repo):
        subprocess.run([
            'sudo',
            'add-apt-repository',
            repo,
        ], stdout=open(os.devnull, 'wb'))

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
class Docker:
    def __init__(self):
        self.os = getSys()
        self.user = getpass.getuser()
        self.path = '/usr/local/bin'

    def __linuxInstall(self):
        # apt dependencies
        apt = Apt()

        apt.update()

        apt.install([
            'apt-transport-https',
            'ca-certificates',
            'curl',
            'gnupg-agent',
            'software-properties-common',
        ])

        # add official docker gpg key
        apt.addGpgKey('https://download.docker.com/linux/ubuntu/gpg')

        print('docker gpg verification below')
        apt.gpgFingerprint('0EBFCD88')

        apt.addAptRepo(
            " ".join([
                "deb [arch=amd64] https://download.docker.com/linux/ubuntu",
                distro.linux_distribution()[2],
                "stable"
            ])
        )

        apt.install([
            'docker-ce',
            'docker-ce-cli',
            'containerd.io',
        ])

        # compose
        composeVersion = getLatestGithubRepo('docker/compose')['name']

        repo = "".join([
            "https://github.com/docker/compose/releases/download/",
            composeVersion,
            "/docker-compose-",
            os.uname().sysname,
            "-",
            os.uname().machine,
        ])

        subprocess.run([
            'sudo',
            'curl',
            '-fsSL',
            repo,
            '-o',
            "".join([self.path + '/' + 'docker-compose']),
        ])

        subprocess.run([
            'sudo',
            'chmod',
            '+x',
            "".join([self.path + '/' + 'docker-compose']),
        ])

    def addUser(self):
        subprocess.run([
            'sudo',
            'usermod',
            '-aG',
            'docker',
            self.user
        ])

    def install(self):
        if self.os == 'linux':
            self.__linuxInstall()
            self.addUser()
        else:
            print('no install instructions for', self.os)

    def uninstall(self):
        if self.os == 'linux':
            print('no uninstall instructions for', self.os)
        else:
            print('no uninstall instructions for', self.os)

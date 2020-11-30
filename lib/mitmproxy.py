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
class Mitmproxy:
    def __init__(self):
        self.os = getSys()
        # self.user = getpass.getuser()
        self.path = '/usr/local/bin'


    def install(self):
        print('*** installing mitmproxy')
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
        mitmproxyVersion = getLatestGithubRepo('mitmproxy/mitmproxy')['tag_name'][1:]
        print(mitmproxyVersion)
        mitmTarball = "".join([
            'https://snapshots.mitmproxy.org/',
            '5.3.0',
            '/mitmproxy-',
            '5.3.0',
            '-linux.tar.gz',
        ])
        # ].join('')
        print(mitmTarball)
        tarballName = 'mitm.tar.gz'
        # tar -xvzf

        subprocess.run([
            'curl',
            '-fsSL',
            mitmTarball,
            '-o',
            tarballName,
        ])

        subprocess.run([
            'sudo',
            'tar',
            '-xvzf',
            tarballName,
            '--directory',
            self.path,
        ])

        subprocess.run([
            'rm',
            tarballName,
        ])

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

from .apt import Apt

class Snap:
    def __init__(self):
        print('*** performing actions for Go package')
        self.os = getSys()

    def __linuxInstall(self):
        subprocess.run([
            'sudo',
            'apt',
            'install',
            '-y',
            'snapd',
        ])

    def install(self):
        print('*** installing', __name__)
        if self.os == 'linux':
            self.__linuxInstall()
        else:
            print('no install instructions for', self.os)

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

from .node import Node

from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo,
)

from .apt import Apt

class Yarn:
    def __init__(self):
        self.os = getSys()
        # self.user = getpass.getuser()
        # self.path = '/usr/local/bin'


    def install(self):
        print('*** installing yarn')
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
        # apt dependencies
        node = Node()
        node.installGlobalPkgs('yarn')

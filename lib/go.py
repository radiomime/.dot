#!/usr/bin/env python3
import getpass
import json
import os
import subprocess
import sys
import time
from os.path import abspath, expanduser
from shutil import which
from sys import platform

import requests

from .snap import Snap
from .util import getLatestGithubRepo, getPyInterpreter, getSys


class Go:
    def __init__(self):
        print("*** performing actions for Go package")
        self.os = getSys()

    def checkInstall(self):
        return which("go") is not None

    def install(self):
        if self.os == "linux":
            self.__linuxInstall()
        else:
            print("no install instructions for", self.os)

    def __linuxInstall(self):
        if not self.checkInstall():
            subprocess.run(["sudo", "snap", "install", "go", "--classic"])
            subprocess.run(["go", "version"])
        self.update()

    def update(self):
        if self.checkInstall():
            subprocess.run(["sudo", "snap", "refresh", "go"])

    def uninstall(self):
        if self.checkInstall():
            subprocess.run(["sudo", "snap", "remove", "go"])

import getpass
import json
import os
import platform
import subprocess
import sys
import time
from os.path import abspath, expanduser
from shutil import which
from sys import platform

import distro
import requests

from .apt import Apt
from .util import getLatestGithubRepo, getPyInterpreter, getSys


#
# TODO: mac install
# TODO: uninstall
# TODO: mac uninstall
#
class Bat:
    def __init__(self):
        self.os = getSys()
        self.user = getpass.getuser()
        self.path = "/usr/local/bin"

    def install(self):
        print("*** installing bat")
        if self.os == "linux":
            self.__linuxInstall()
        else:
            print("no install instructions for", self.os)

    def uninstall(self):
        if self.os == "linux":
            print("no uninstall instructions for", self.os)
        else:
            print("no uninstall instructions for", self.os)

    def __linuxInstall(self):
        batVersion = getLatestGithubRepo("sharkdp/bat")["name"]

        repo = "".join(
            [
                "https://github.com/sharkdp/bat/releases/download/",
                batVersion,
                "/",
                "bat_",
                batVersion[1:],
                "_amd64.deb",
            ]
        )

        subprocess.run(
            [
                "curl",
                "-fsSL",
                repo,
                "-o",
                "".join("bat_amd64.deb"),
            ]
        )

        subprocess.run(
            [
                "sudo",
                "dpkg",
                "-i",
                "bat_amd64.deb",
            ]
        )

        subprocess.run(
            [
                "rm",
                "bat_amd64.deb",
            ]
        )

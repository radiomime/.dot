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

from .apt import Apt
from .util import getLatestGithubRepo, getPyInterpreter, getSys


class Node:
    def __init__(self):
        self.os = getSys()
        # Install n, for instance
        # update && upgrade node && npm
        # curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
        # sudo apt-get install -y nodejs

    def checkInstall(self):
        return which("node") is not None

    def install(self):
        print("*** installing node from deb.nodesource.com")
        if self.os == "linux":
            self.__linuxInstall()
        else:
            print("no install instructions for", self.os)

    def __linuxInstall(self):
        if self.checkInstall:
            return

        installSource = "https://deb.nodesource.com/setup_current.x"
        subprocess.run(
            [
                "curl",
                "-fsSL",
                installSource,
                "-o",
                "".join("nodeInstall.sh"),
            ]
        )

        subprocess.run(
            [
                "sudo",
                "bash",
                "nodeInstall.sh",
            ],
            stdout=open(os.devnull, "wb"),
        )

        subprocess.run(
            [
                "rm",
                "nodeInstall.sh",
            ]
        )

        apt = Apt()
        apt.update()
        apt.install(["nodejs"])

    def install_global_packages(self, pkgs):
        if not self.checkInstall:
            print("Node is not installed, so global packages cannot be added")
            return
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "sudo",
            "npm",
            "install",
            "-g",
        ]
        cmd.extend(pkgs)

        print("installing:", pkgs)
        subprocess.run(cmd)

    def uninstall_global_packages(self, pkgs):
        if not self.checkInstall:
            print("Node is not installed, so global packages cannot be added")
            return

        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "sudo",
            "npm",
            "uninstall",
            "-g",
        ]
        cmd.extend(pkgs)

        print("installing:", pkgs)
        subprocess.run(cmd)

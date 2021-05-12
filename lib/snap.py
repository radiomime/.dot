#!/usr/bin/env python3
import subprocess

from .util import getSys


class Snap:
    def __init__(self):
        print("*** performing actions for Go package")
        self.os = getSys()

    def __linuxInstall(self):
        subprocess.run(
            [
                "sudo",
                "apt",
                "install",
                "-y",
                "snapd",
            ]
        )

    def install(self):
        print("*** installing", __name__)
        if self.os == "linux":
            self.__linuxInstall()
        else:
            print("no install instructions for", self.os)

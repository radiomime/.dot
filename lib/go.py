#!/usr/bin/env python3
import subprocess
from .brew import Brew

from .abs_package import Package
from .snap import Snap
from .util import is_installed


class Go(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("go")

    def get_version(self):
        output = subprocess.check_output(
            [
                "go",
                "version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "go":
                return words[2][2:]

        # should never be hit
        return None

    def linux_install(self):
        snap = Snap()
        snap.snap_install("go", flags="--classic")

    def linux_uninstall(self):
        snap = Snap()
        snap.snap_uninstall("go")

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="go",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="go",
        )


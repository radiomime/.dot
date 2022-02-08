#!/usr/bin/env python3
import subprocess
from os.path import abspath, expanduser
from .apt import Apt
from .brew import Brew

from .abs_package import AbsPackage

from .util import github_release_metadata, is_installed


class Stow(AbsPackage):
    def __init__(self, config_dir=abspath(expanduser("~/.config/nvim"))):
        super().__init__()

    def is_installed(self):
        return is_installed("stow")

    def get_version(self):
        output = subprocess.check_output(
            [
                "stow",
                "--version",
            ]
        )
        output = output.decode("utf-8")

        words = output.split(" ")
        if words[0] == "stow":
            return words[4].strip()

        # should never be hit
        return None

    def linux_install(self):
        apt = Apt()
        apt.install(["stow"])

    def linux_uninstall(self):
        apt = Apt()
        apt.uninstall(["stow"])

    def osx_dependencies(self):
        Brew().install()

    def osx_install(self):
        brew = Brew()
        brew.brew_install(["stow"])

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(["stow"])

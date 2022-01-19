#!/usr/bin/env python3
import subprocess
from os.path import abspath, expanduser

from .abs_package import AbsPackage
from .stow import Stow


class Dot(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return False

    def get_version(self):
        return None

    def __install(self):
        print("using stow to install configuration files")
        subprocess.run(
            [
                "stow",
                # "--no",
                "--dir",
                "config",
                "--target",
                abspath(expanduser("~")),
                # below are paths to include.
                # TODO: how about these under .dot at base level
                # this would require ignoring some install scripts
                "bash",
                "fish",
                "git",
                "kitty",
                "nvim",
                "starship",
                "tmux",
            ]
        )

    def __uninstall(self):
        # TODO: add a stow remove here
        print("TODO: stow remove")

    def linux_dependencies(self):
        Stow().install()

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_dependencies(self):
        Stow().install()

    def osx_install(self):
        self.__install()

    def osx_uninstall(self):
        self.__uninstall()

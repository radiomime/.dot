#!/usr/bin/env python3
from .brew import Brew

from .abs_package import AbsPackage
from .snap import Snap
from .util import  is_installed
from .go import Go


class Lazygit(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("lazygit")

    def get_version(self):
        return "unversioned"

        # should never be hit
        return None

    def linux_install(self):
        go = Go()
        go.go_install("github.com/jesseduffield/lazygit@latest")

    def linux_uninstall(self):
        go = Go()
        go.go_uninstall("lazygit")

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="lazygit",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="lazygit",
        )

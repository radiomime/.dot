import subprocess

from .abs_package import AbsPackage
from .brew import Brew
from .pip import Pip
from .util import github_release_metadata, is_installed


class Black(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("black")

    def get_version(self):
        output = subprocess.check_output(
            [
                "black",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "black,":
                return words[2]

        # should never be hit
        return None

    def linux_install(self):
        pip = Pip()
        pip.pip_install("black")

    def linux_uninstall(self):
        pip = Pip()
        pip.pip_uninstall("black")

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="black",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="black",
        )

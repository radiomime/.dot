import subprocess

from .abs_package import Package
from .rust import Rust
from .util import is_installed


class Exa(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("exa")

    def get_version(self):
        output = subprocess.check_output(
            [
                "exa",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0][0] == "v":
                return words[0][1:]

        # should never be hit
        return None

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_install(self):
        self.__install()

    def osx_uninstall(self):
        self.__uninstall()

    def __install(self):
        rust = Rust()
        rust.cargo_install("exa")

    def __uninstall(self):
        rust = Rust()
        rust.cargo_uninstall("exa")


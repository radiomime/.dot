import subprocess

from .abs_package import Package
from .rust import Rust
from .util import is_installed


class Watchexec(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("watchexec")

    def get_version(self):
        output = subprocess.check_output(
            [
                "watchexec",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "watchexec":
                return words[1]

        # should never be hit
        return None

    def linux_install(self):
        rust = Rust()
        rust.cargo_install("watchexec-cli")

    def linux_uninstall(self):
        rust = Rust()
        rust.cargo_uninstall("watchexec-cli")

    def osx_install(self):
        rust = Rust()
        rust.cargo_install("watchexec-cli")

    def osx_uninstall(self):
        rust = Rust()
        rust.cargo_uninstall("watchexec-cli")


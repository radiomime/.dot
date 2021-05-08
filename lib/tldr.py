import subprocess

from .abs_package import Package
from .apt import Apt
from .node import Node  # install_global_packages, uninstall_global_packages
from .util import bin_loc, github_release_metadata, is_installed


class Tldr(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("tldr")

    def get_version(self):
        output = subprocess.check_output(
            [
                "tldr",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        words = output.split(" ")
        if words[0] == "tldr,":
            return words[2].rstrip()

        # should never be hit
        return None

    def __install(self):
        node = Node()
        node.install_global_packages("tldr")

    def __uninstall(self):
        node = Node()
        node.uninstall_global_packages("tldr")

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

import subprocess

from .abs_package import Package
from .node import Node
from .util import is_installed


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
        return output.rstrip()

    def __install(self):
        node = Node()
        node.node_install("tldr")

    def __uninstall(self):
        node = Node()
        node.node_uninstall("tldr")

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

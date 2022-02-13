import subprocess

from .abs_package import AbsPackage
from .node import Node
from .util import is_installed


class Prettier(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("prettier")

    def get_version(self):
        output = subprocess.check_output(
            [
                "prettier",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        return output.rstrip()

    def __install(self):
        node = Node()
        node.node_install("prettier")

    def __uninstall(self):
        node = Node()
        node.node_uninstall("prettier")

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_install(self):
        self.__install()

    def osx_uninstall(self):
        self.__uninstall()

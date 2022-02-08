import subprocess

from .abs_package import AbsPackage
from .node import Node
from .util import is_installed


class Yarn(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("yarn")

    def get_version(self):
        output = subprocess.check_output(
            [
                "yarn",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        return output.rstrip()

    def __install(self):
        node = Node()
        node.node_install("yarn")

    def __uninstall(self):
        node = Node()
        node.node_uninstall("yarn")

    def linux_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_install(self):
        self.__install()

    def osx_uninstall(self):
        self.__uninstall()

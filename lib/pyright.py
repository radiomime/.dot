import subprocess
from .node import Node

from .brew import Brew
from .abs_package import Package
from .util import github_release_metadata, is_installed






class Pyright(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("pyright")

    def get_version(self):

        # output = subprocess.check_output(
        #     [
        #         "rg",
        #         "--version",
        #     ]
        # )
        # output = output.decode("utf-8")
        # for line in output.split("\n"):
        #     words = line.split(" ")
        #     if words[0] == "ripgrep":
        #         return words[1]

        # should never be hit
        return None

    def osx_install(self):
        node = Node()
        node.node_install('pyright')


    def osx_uninstall(self):
        node = Node()
        node.node_uninstall('pyright')


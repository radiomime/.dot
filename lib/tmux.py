import subprocess
from .brew import Brew

from .abs_package import Package
from .util import github_release_metadata, is_installed


class Tmux(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("tmux")

    def get_version(self):
        output = subprocess.check_output(
            [
                "tmux",
                "-V",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "tmux":
                return words[1]

        # should never be hit
        return None

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="tmux",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="tmux",
        )


import subprocess
from .brew import Brew

from .abs_package import Package
from .util import github_release_metadata, is_installed ,is_installed_osx_app


class Hammerspoon(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("hammerspoon")

    def get_version(self):
        if is_installed_osx_app('hammerspoon'):
            return "mac app version unsupported"

        output = subprocess.check_output(
            [
                "hammerspoon",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "Mitmproxy:":
                return words[1]

        # should never be hit
        return None

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="hammerspoon",
            flags="--cask",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="hammerspoon",
        )


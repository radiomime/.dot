import subprocess
from typing import Optional

from .abs_package import Package
from .apt import Apt
from .util import bin_loc, github_release_metadata, is_installed


class Fish(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("fish")

    def get_version(self):
        output = subprocess.check_output(
            [
                "fish",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        words = output.split(" ")
        if words[0] == "fish,":
            return words[2].rstrip()

        # should never be hit
        return None

    def __change_shell(self, shell="fish"):
        print("changing to fish shell")
        shell = bin_loc(shell)
        if shell:
            subprocess.run(
                [
                    "chsh",
                    "-s",
                    shell,
                ]
            )

    def linux_install(self):
        apt = Apt()
        apt.add_apt_repo("ppa:fish-shell/release-3")
        apt.update()
        apt.install("fish")

        self.__change_shell()

    def linux_uninstall(self):
        apt = Apt()
        apt.uninstall("fish")

import subprocess
from typing import Optional

from .abs_package import AbsPackage
from .apt import Apt
from .brew import Brew
from .util import bin_loc, github_release_metadata, is_installed, get_user_approval

# TODO: be safe when doing chsh!!


class Fish(AbsPackage):
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

    def __update_shell(self):
        favorite_shells = ["fish", "bash", "zsh", "sh"]

        for shell in favorite_shells:
            shell_loc = bin_loc(shell)
            if shell_loc is not None and get_user_approval(
                "change shell to ", shell_loc, "?"
            ):
                print("updating shell to:", shell_loc)
                subprocess.run(["chsh", "-s", shell_loc])
                return

    def __check_for_shell_in_etc_shells(self, shell):
        shell_loc = bin_loc(shell)
        file = open("/etc/shells", "r")
        lines = file.readlines()
        for line in lines:
            if shell_loc == line.strip():
                print("shell is in /etc/shells:", shell_loc)
                return True
        print("shell is not in /etc/shells:", shell_loc)
        return False

    def __add_shell_to_etc_shells(self, shell):
        shell_loc = bin_loc("fish")

        if shell_loc is not None and not self.__check_for_shell_in_etc_shells(shell):
            print("adding", shell_loc, "to /etc/shells")

            ps = subprocess.Popen(
                ("echo", shell_loc),
                stdout=subprocess.PIPE,
            )

            output = subprocess.check_output(
                (
                    "sudo",
                    "tee",
                    "-a",
                    "/etc/shells",
                ),
                stdin=ps.stdout,
            )
            ps.wait()

    def linux_install(self):
        apt = Apt()
        apt.add_apt_repo("ppa:fish-shell/release-3")
        apt.update()
        apt.install("fish")

        self.__add_shell_to_etc_shells("fish")
        self.__update_shell()

    def linux_uninstall(self):
        apt = Apt()
        apt.uninstall("fish")

        self.__update_shell()

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="fish",
            flags="--HEAD",
        )

        self.__add_shell_to_etc_shells("fish")
        self.__update_shell()

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="fish",
        )
        self.__update_shell()

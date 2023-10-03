#!/usr/bin/env python3
import subprocess
from .brew import Brew
from os.path import expanduser

from .abs_package import AbsPackage
from .snap import Snap
from .util import is_installed, get_user_approval


class Go(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("go")

    def get_version(self):
        output = subprocess.check_output(
            [
                "go",
                "version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "go":
                return words[2][2:]

        # should never be hit
        return None

    def linux_install(self):
        snap = Snap()
        snap.snap_install("go", flags="--classic")

    def linux_uninstall(self):
        snap = Snap()
        snap.snap_uninstall("go")

    # def osx_install(self):
    #     brew = Brew()
    #     brew.brew_install(
    #         pkgs="go",
    #     )
    #
    # def osx_uninstall(self):
    #     brew = Brew()
    #     brew.brew_uninstall(
    #         pkgs="go",
    #     )

    def __continue_with_go_op(self):
        if not self.is_installed():
            if get_user_approval("install go?"):
                self.install()
                return True
        return False

    def go_install(
        self,
        pkg: str,
    ):
        if not self.__continue_with_go_op():
            print(f"cannot install: {pkg}")

        cmd = [
            "go",
            "install",
        ]
        cmd.extend([pkg])

        print(f"running go install: {cmd}")
        subprocess.run(cmd)

    def go_uninstall(
        self,
        pkg: str,
    ):
        if not self.__continue_with_go_op():
            print(f"cannot uninstall: {pkg}")

        if not isinstance(pkg, str):
            print("error: only expected a string")
            return

        cmd = [
            "rm",
        ]
        cmd.extend(["".join([expanduser("~/go/bin/"), pkg])])

        print(f"running go uninstall: {cmd}")
        subprocess.run(cmd)

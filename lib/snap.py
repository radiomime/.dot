#!/usr/bin/env python3
import subprocess

from .abs_package import Package
from .apt import Apt
from .util import  is_installed


class Snap(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("snap")

    def get_version(self):
        output = subprocess.check_output(
            [
                "snap",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "snap":
                return words[-1]

        # should never be hit
        return None

    def linux_install(self):
        apt = Apt()
        apt.install("snapd")

    def linux_uninstall(self):
        apt = Apt()
        apt.uninstall("snapd")

    def snap_install(self, pkgs, flags=None):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: snap is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "sudo",
            "snap",
            "install",
        ]
        cmd.extend(pkgs)

        # add flags to command if they exist
        if isinstance(flags, list) or isinstance(flags, str):
            if isinstance(flags, str):
                flags = [flags]

            cmd.extend(flags)

        print("snap installing:", pkgs)
        subprocess.run(cmd)

    def snap_uninstall(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: snap is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "sudo",
            "snap",
            "remove",
        ]
        cmd.extend(pkgs)

        print("snap removing:", pkgs)
        subprocess.run(cmd)

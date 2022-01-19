import subprocess

from .abs_package import AbsPackage
from .util import github_release_metadata, is_installed


class Rust(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("rustup") and is_installed("cargo")

    def get_version(self):
        output = subprocess.check_output(
            [
                "rustc",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "rustc":
                return words[1]

        # should never be hit
        return None

    def __install(self):
        self.install_from_curled_script("https://sh.rustup.rs")

    def __uninstall(self):
        if self.is_installed():
            subprocess.run(
                [
                    "rustup",
                    "self",
                    "uninstall",
                ]
            )

    def linux_install(self):
        self.__install()

    def osx_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_uninstall(self):
        self.__uninstall()

    def cargo_install(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: cargo is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "cargo",
            "install",
            # "--quiet",
        ]
        cmd.extend(pkgs)

        print("cargo installing:", pkgs)
        subprocess.run(cmd)

    def cargo_uninstall(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: cargo is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "cargo",
            "uninstall",
            "--quiet",
        ]
        cmd.extend(pkgs)

        print("cargo uninstalling:", pkgs)
        subprocess.run(cmd)
